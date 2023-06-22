CUDA_VISIBLE_DEVICES=4,5 python -m vllm.entrypoints.api_server \
        --model /rscratch/data/llama-hf/vicuna-13b/ --swap-space 16 \
        --disable-log-requests \
        -tp 2