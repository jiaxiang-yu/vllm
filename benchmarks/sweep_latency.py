import csv
import argparse
import os

def run_cmd(cmd):
    print(cmd)
    return os.system(cmd)

def bs_to_cmd(args, bs):
    cmd = "python benchmark_latency.py "
    for k in vars(args):
        if k == "batch_size":
            continue 
        if type(vars(args)[k]) == bool and vars(args)[k] == False:
            continue
        k_str = k.replace('_', '-')
        v_str = vars(args)[k] if type(vars(args)[k]) != bool else ''
        cmd += f"--{k_str} {v_str} "
    cmd += f"--batch-size {bs}"
    return cmd

def sweep_batch_size(args):
    with open("latency.csv", 'w', newline='') as f:
        fieldnames = list(vars(args).keys()) + ["latency"]
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        for bs in [1, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024]:
            print(f"{bs}===============================")
            args.batch_size = bs
            record = vars(args).copy()
            record['latency'] = run_cmd(bs_to_cmd(args, bs))
            writer.writerow(record)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description='Benchmark the latency of processing a single batch of '
                    'requests till completion.')
    parser.add_argument('--model', type=str, default='facebook/opt-125m')
    parser.add_argument('--tensor-parallel-size', '-tp', type=int, default=1)
    parser.add_argument('--input-len', type=int, default=32)
    parser.add_argument('--output-len', type=int, default=128)
    parser.add_argument('--batch-size', type=int, default=8)
    parser.add_argument('--n', type=int, default=1,
                        help='Number of generated sequences per prompt.')
    parser.add_argument('--use-beam-search', action='store_true')
    parser.add_argument('--num-iters', type=int, default=3,
                        help='Number of iterations to run.')
    args = parser.parse_args()
    sweep_batch_size(args)