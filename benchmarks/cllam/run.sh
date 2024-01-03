python benchmarks/cllam/sweep.py --model /data/models/models--lmsys--vicuna-13b-v1.3/snapshots/6566e9cb1787585d1147dcf4f9bc48f29e1328d2/ \
        --tokenizer /data/models/models--lmsys--vicuna-13b-v1.3/snapshots/6566e9cb1787585d1147dcf4f9bc48f29e1328d2/ \
        --dataset /data/ShareGPT_V3_unfiltered_cleaned_split.json \
        --vllm_dir /data/vllm_cllam \
        --prompt_len 128 \
        --gen_len 128 \
        --repeat_num 1 \
        --request_rate_params 2,30,2 \
        --num_requests 1000 

python benchmarks/cllam/sweep.py --model /data/models/models--lmsys--vicuna-13b-v1.3/snapshots/6566e9cb1787585d1147dcf4f9bc48f29e1328d2/ \
        --tokenizer /data/models/models--lmsys--vicuna-13b-v1.3/snapshots/6566e9cb1787585d1147dcf4f9bc48f29e1328d2/ \
        --dataset /data/ShareGPT_V3_unfiltered_cleaned_split.json \
        --vllm_dir /data/vllm_cllam \
        --prompt_len 512 \
        --gen_len 512 \
        --repeat_num 1 \
        --request_rate_params 2,20,2\
        --num_requests 1000