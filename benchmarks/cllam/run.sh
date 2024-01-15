# python benchmarks/cllam/sweep.py --model /data/models/vicuna-7b-v1.3/ \
#         --tokenizer /data/models/vicuna-7b-v1.3/ \
#         --dataset /data/ShareGPT_V3_unfiltered_cleaned_split.json \
#         --vllm_dir /data/vllm_cllam \
#         --prompt_len 128 \
#         --gen_len 128 \
#         --repeat_num 1 \
#         --request_rate_params 20,21,2 \
#         --num_requests 1000


# python benchmarks/cllam/sweep.py --model /data/models/vicuna-7b-v1.3/ \
#         --tokenizer /data/models/vicuna-7b-v1.3/ \
#         --dataset /data/ShareGPT_V3_unfiltered_cleaned_split.json \
#         --vllm_dir /data/vllm_cllam \
#         --prompt_len 256 \
#         --gen_len 128 \
#         --repeat_num 1 \
#         --request_rate_params 1,30,1 \
#         --num_requests 1000


# python benchmarks/cllam/sweep.py --model /data/models/vicuna-7b-v1.3/ \
#         --tokenizer /data/models/vicuna-7b-v1.3/ \
#         --dataset /data/ShareGPT_V3_unfiltered_cleaned_split.json \
#         --vllm_dir /data/vllm_cllam \
#         --prompt_len 512 \
#         --gen_len 128 \
#         --repeat_num 1 \
#         --request_rate_params 1.5,20,0.5 \
#         --num_requests 1000

python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/ \
        --tokenizer ~/data/models/vicuna-7b-v1.3/ \
        --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json \
        --vllm_dir ~/data/vllm \
        --prompt_len 64 \
        --gen_len 256 \
        --repeat_num 1 \
        --request_rate_params 1,32,1 \
        --num_requests 1000

# python benchmarks/benchmark_throughput.py \
#         --input-len 128 \
#         --output-len 128 \
#         --model /data/models/vicuna-7b-v1.3/ \
#         --tokenizer /data/models/vicuna-7b-v1.3/ \
#         --num-prompts 1000