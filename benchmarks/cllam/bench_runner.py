import os

def generate_bash_script(prompt_len_range, gen_len_range, request_rate_params_range):
    model = "~/data/models/llama-2-7b-hf/"
    tokenizer = "~/data/models/llama-2-7b-hf/"
    dataset = "~/data/ShareGPT_V3_unfiltered_cleaned_split.json"
    vllm_dir = "~/vllm"
    repeat_num = 1
    num_requests = 1000
    tensor_parallel_size = 1

    with open("run_more_tp1.sh", "w") as f:
        for prompt_len in prompt_len_range:
            gen_len = prompt_len
            for request_rate_params in request_rate_params_range:
                f.write(f"""
start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model {model} \
        --tokenizer {tokenizer} \
        --dataset {dataset} \
        --vllm_dir {vllm_dir} \
        --prompt_len {prompt_len} \
        --gen_len {gen_len} \
        --repeat_num {repeat_num} \
        --request_rate_params {request_rate_params} \
        --num_requests {num_requests} \
        --tensor_parallel_size {tensor_parallel_size}
end=$(date +%s.%N)
runtime=$(python -c "print(${{end}} - ${{start}})")

mv {vllm_dir}/cllam/trace {vllm_dir}/cllam/{prompt_len}-{gen_len}
mv {vllm_dir}/data/* {vllm_dir}/cllam/{prompt_len}-{gen_len}
echo "Runtime: $runtime sec" >> {vllm_dir}/cllam/{prompt_len}-{gen_len}/done
echo "python benchmarks/cllam/sweep.py --model {model} \
        --tokenizer {tokenizer} \
        --dataset {dataset} \
        --vllm_dir {vllm_dir} \
        --prompt_len {prompt_len} \
        --gen_len {gen_len} \
        --repeat_num {repeat_num} \
        --request_rate_params {request_rate_params} \
        --num_requests {num_requests} \
        --tensor_parallel_size {tensor_parallel_size}" >> {vllm_dir}/cllam/{prompt_len}-{gen_len}/done
""")

if __name__ == "__main__":
    prompt_len_range = [250, 500, 1000]
    gen_len_range = [250, 500, 1000]
    request_rate_params_range = ["1,10,1"]
    generate_bash_script(prompt_len_range, gen_len_range, request_rate_params_range)