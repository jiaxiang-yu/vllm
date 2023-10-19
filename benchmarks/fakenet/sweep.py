from dataclasses import dataclass
import subprocess
from subprocess import CompletedProcess
from typing import List
from enum import Enum
import torch
import os
import time
import signal
import csv
import argparse

class DumpFormat(Enum):
    JSON = 1
    CSV = 2
    
@dataclass
class BenchSetting:
    model: str
    tokenizer: str
    device: str
    backend: str
    dataset: str
    req_rate: float
    tp: int
    
    @staticmethod
    def get_head(format):
        assert format == DumpFormat.CSV
        return ["model", "device", "backend", "dataset", "req_rate", "tp"]
    
    def get_value_list(self, format):
        assert format == DumpFormat.CSV
        return [self.model, self.device, self.backend, self.dataset, self.req_rate, self.tp]
    
@dataclass
class BenchResult:
    setting: BenchSetting
    avg_per_token_latency: float
    avg_per_output_token_latency: float
    avg_latency: float
    total_time: float
    throughput: float
    
    @staticmethod
    def get_head(format):
        assert format == DumpFormat.CSV
        return (BenchSetting.get_head(format) + 
                ["avg_per_token_latency", "avg_per_output_token_latency", 
                 "avg_latency", "total_time", "throughput"])
    
    def get_value_list(self, format):
        assert format == DumpFormat.CSV
        return (self.setting.get_value_list(format) +
                [self.avg_per_token_latency, self.avg_per_output_token_latency, 
                 self.avg_latency, self.total_time, self.throughput])
    
class Util:
    @staticmethod
    def run_cmd(cmd, blocking = True):
        def set_new_pgroup():
            os.setpgrp()
        print(cmd)
        if blocking:
            return subprocess.run(cmd, shell=True, capture_output=True, text=True)
        else:
            return subprocess.Popen(cmd, shell=True, preexec_fn=set_new_pgroup)
    
class BenchEngine:
    def __init__(self, backend, model, tokenizer, tp, vllm_dir) -> None:
        self.backend_process: subprocess.Popen = None
        # launch backend
        if backend == "vllm":
            cmd = ("python -m vllm.entrypoints.api_server"
                  f" --model {model} --tensor-parallel-size {tp} "
                  f" --tokenizer {tokenizer} --disable-log-requests")
            self.backend_process = Util.run_cmd(cmd, False)
            self.vllm_dir = vllm_dir
        elif backend == "tgi":
            cmd = ("docker run --gpus all --shm-size 1g -p 8000:80 "
                "-v $PWD/data:/data "
                "ghcr.io/huggingface/text-generation-inference:0.9 "
                "--model-id lmsys/vicuna-13b-v1.3 "
                f"--num-shard {tp}  "
                "--max-input-length 4096 "
                "--max-total-tokens 4098 "
                "--max-best-of 5 "
                "--max-concurrent-requests 5000 "
                "--max-batch-total-tokens 4098")
            self.backend_process = Util.run_cmd(cmd, False)
        else:
            raise NotImplementedError(f"{backend}")
    
    def bench(self, runs : List[BenchSetting]) -> List[BenchResult]:
        time.sleep(60)
        print("============Start Benchmarking==================")
        return [self.bench_single(run) for run in runs]
    
    def bench_single(self, run: BenchSetting) -> BenchResult:
        cmd = (f"python {self.vllm_dir}/benchmarks/fakenet/bench_serving.py"
               f" --dataset {run.dataset} --backend {run.backend}"
               f" --tokenizer {run.tokenizer} --request-rate {run.req_rate}")
        completed_process: CompletedProcess = Util.run_cmd(cmd, True)
        def process_output(completed_process: CompletedProcess):
            if completed_process.returncode != 0:
                print(f"[Error] {completed_process.stdout}")
                print(f"[Error] {completed_process.stderr}")
                return BenchResult(run, -1, -1, -1, -1, -1)
            lines = completed_process.stdout.split('\n')
            for line in lines:
                if 'Total time' in line:
                    total_time = float(line.split(" ")[-2])
                if 'Throughput' in line:
                    throughput = float(line.split(" ")[-2])
                if 'Average latency' in line:
                    avg_latency = float(line.split(" ")[-2])
                if 'Average latency per token' in line:
                    avg_per_token_latency = float(line.split(" ")[-2])
                if 'Average latency per output token' in line:
                    avg_per_output_token_latency = float(line.split(" ")[-2])
            return BenchResult(run, avg_per_token_latency, avg_per_output_token_latency, avg_latency, total_time, throughput)
        return process_output(completed_process)
        
        
    
    def dump_results(self, results: List[BenchResult], outfile: str, format: DumpFormat) -> None:
        with open(outfile, "w") as f:
            if format == DumpFormat.CSV:
                writer = csv.writer(f)
                writer.writerow(BenchResult.get_head(format))
            for result in results:
                writer.writerow(result.get_value_list(format))
                
    
    def __del__(self):
        # stop backend
        print("==============Finish Benchmarking==============")
        if self.backend_process.poll() is None:  # If poll() returns None, the process is still running
            print("Process is running, trying to kill...")
            os.killpg(self.backend_process.pid, signal.SIGINT)
            time.sleep(10) # wait a bit for cleaning resources
            self.backend_process.terminate()
            self.backend_process.wait()
            time.sleep(1)
            if self.backend_process.poll() is not None:
                print(f"Process {self.backend_process.pid} killed successfully.")
            else:
                print("Failed to kill process.")
        else:
            print("Process already terminated.")
        
def main(vllm_dir, model, tokenizer, backend, dataset, outfile):
    device = torch.cuda.get_device_name(0)
    
    for tp in [1]:
        runs = []
        for req_rate in range(20, 400, 40):
            req_rate = req_rate / 10.0
            runs.append(BenchSetting(model, tokenizer, device, backend, dataset, req_rate, tp))
        engine = BenchEngine(backend, model, tokenizer, tp, vllm_dir)
        results = engine.bench(runs)
        engine.dump_results(results, outfile + f"_tp{tp}", DumpFormat.CSV)
    

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--model", type=str, default="/data/model/vicuna-7b-v1.3/")
    parser.add_argument("--tokenizer", type=str, default="/data/model/vicuna-7b-v1.3/")
    parser.add_argument("--backend", type=str, choices=["vllm"], default="vllm")
    parser.add_argument("--dataset", type=str, 
        default="/data/ShareGPT_V3_unfiltered_cleaned_split.json")
    parser.add_argument("--vllm_dir", type=str, default="/home/lily/vllm_bench")
    parser.add_argument("--outfile", type=str, default="bench_results")
    args = parser.parse_args()
    main(args.vllm_dir, args.model, args.tokenizer, args.backend, args.dataset, args.outfile)