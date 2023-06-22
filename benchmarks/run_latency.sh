CUDA_VISIBLE_DEVICES=4,5,6,7 python sweep_latency.py \
--model /rscratch/data/llama-hf/vicuna-13b/ \
--tensor-parallel-size 4 \
--input-len 32 \
--output-len 128 \
--batch-size 1 \
--n 1 \
--num-iters 3