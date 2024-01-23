start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/ \
        --tokenizer ~/data/models/vicuna-7b-v1.3/ \
        --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json \
        --vllm_dir ~/vllm \
        --prompt_len 64 \
        --gen_len 256 \
        --repeat_num 1 \
        --request_rate_params 1,32,1 \
        --num_requests 1000 \
        --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/64-256
mv ~/vllm/data/* ~/vllm/cllam/64-256
echo "Runtime: $runtime sec" >> ~/vllm/cllam/64-256/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/ \
        --tokenizer ~/data/models/vicuna-7b-v1.3/ \
        --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json \
        --vllm_dir ~/vllm \
        --prompt_len 64 \
        --gen_len 256 \
        --repeat_num 1 \
        --request_rate_params 1,32,1 \
        --num_requests 1000 \
        --tensor_parallel_size 4" >> ~/vllm/cllam/64-256/done


# start=$(date +%s.%N)
# python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/ \
#         --tokenizer ~/data/models/vicuna-7b-v1.3/ \
#         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json \
#         --vllm_dir ~/vllm \
#         --prompt_len 64 \
#         --gen_len 64 \
#         --repeat_num 1 \
#         --request_rate_params 1,32,1 \
#         --num_requests 1000 \
#         --tensor_parallel_size 4
# end=$(date +%s.%N)
# runtime=$(python -c "print(${end} - ${start})")

# mv ~/vllm/cllam/trace ~/vllm/cllam/64-64
# mv ~/vllm/data/* ~/vllm/cllam/64-64
# echo "Runtime: $runtime sec" >> ~/vllm/cllam/64-64/done
# echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/ \
#         --tokenizer ~/data/models/vicuna-7b-v1.3/ \
#         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json \
#         --vllm_dir ~/vllm \
#         --prompt_len 64 \
#         --gen_len 64 \
#         --repeat_num 1 \
#         --request_rate_params 1,32,1 \
#         --num_requests 1000 \
#         --tensor_parallel_size 4" >> ~/vllm/cllam/64-64/done

# start=$(date +%s.%N)
# python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/ \
#         --tokenizer ~/data/models/vicuna-7b-v1.3/ \
#         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json \
#         --vllm_dir ~/vllm \
#         --prompt_len 64 \
#         --gen_len 128 \
#         --repeat_num 1 \
#         --request_rate_params 1,32,1 \
#         --num_requests 1000 \
#         --tensor_parallel_size 4
# end=$(date +%s.%N)
# runtime=$(python -c "print(${end} - ${start})")

# mv ~/vllm/cllam/trace ~/vllm/cllam/64-128
# mv ~/vllm/data/* ~/vllm/cllam/64-128
# echo "Runtime: $runtime sec" >> ~/vllm/cllam/64-128/done
# echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/ \
#         --tokenizer ~/data/models/vicuna-7b-v1.3/ \
#         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json \
#         --vllm_dir ~/vllm \
#         --prompt_len 64 \
#         --gen_len 128 \
#         --repeat_num 1 \
#         --request_rate_params 1,32,1 \
#         --num_requests 1000 \
#         --tensor_parallel_size 4" >> ~/vllm/cllam/64-128/done


start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/ \
        --tokenizer ~/data/models/vicuna-7b-v1.3/ \
        --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json \
        --vllm_dir ~/vllm \
        --prompt_len 800 \
        --gen_len 64 \
        --repeat_num 1 \
        --request_rate_params 1,32,1 \
        --num_requests 1000 \
        --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/800-64
mv ~/vllm/data/* ~/vllm/cllam/800-64
echo "Runtime: $runtime sec" >> ~/vllm/cllam/800-64/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/ \
        --tokenizer ~/data/models/vicuna-7b-v1.3/ \
        --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json \
        --vllm_dir ~/vllm \
        --prompt_len 800 \
        --gen_len 64 \
        --repeat_num 1 \
        --request_rate_params 1,32,1 \
        --num_requests 1000 \
        --tensor_parallel_size 4" >> ~/vllm/cllam/800-64/done

touch ~/vllm/cllam/all_done