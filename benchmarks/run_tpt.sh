CUDA_VISIBLE_DEVICES=4,5,6,7 python benchmark_throughput.py \
--num-prompts 1024 \
--backend vllm \
--dataset /rscratch/zhendong/lily/data/ShareGPT_V3_unfiltered_cleaned_split_no_imsorry.json \
--model /rscratch/data/llama-hf/vicuna-13b/ \
--tensor-parallel-size 4 \
--n 1