
start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 128         --gen_len 128         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/128-128
mv ~/vllm/data/* ~/vllm/cllam/128-128
echo "Runtime: $runtime sec" >> ~/vllm/cllam/128-128/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 128         --gen_len 128         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/128-128/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 128         --gen_len 256         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/128-256
mv ~/vllm/data/* ~/vllm/cllam/128-256
echo "Runtime: $runtime sec" >> ~/vllm/cllam/128-256/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 128         --gen_len 256         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/128-256/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 128         --gen_len 512         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/128-512
mv ~/vllm/data/* ~/vllm/cllam/128-512
echo "Runtime: $runtime sec" >> ~/vllm/cllam/128-512/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 128         --gen_len 512         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/128-512/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 128         --gen_len 1024         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/128-1024
mv ~/vllm/data/* ~/vllm/cllam/128-1024
echo "Runtime: $runtime sec" >> ~/vllm/cllam/128-1024/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 128         --gen_len 1024         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/128-1024/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 256         --gen_len 128         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/256-128
mv ~/vllm/data/* ~/vllm/cllam/256-128
echo "Runtime: $runtime sec" >> ~/vllm/cllam/256-128/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 256         --gen_len 128         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/256-128/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 256         --gen_len 256         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/256-256
mv ~/vllm/data/* ~/vllm/cllam/256-256
echo "Runtime: $runtime sec" >> ~/vllm/cllam/256-256/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 256         --gen_len 256         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/256-256/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 256         --gen_len 512         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/256-512
mv ~/vllm/data/* ~/vllm/cllam/256-512
echo "Runtime: $runtime sec" >> ~/vllm/cllam/256-512/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 256         --gen_len 512         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/256-512/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 256         --gen_len 1024         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/256-1024
mv ~/vllm/data/* ~/vllm/cllam/256-1024
echo "Runtime: $runtime sec" >> ~/vllm/cllam/256-1024/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 256         --gen_len 1024         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/256-1024/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 512         --gen_len 128         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/512-128
mv ~/vllm/data/* ~/vllm/cllam/512-128
echo "Runtime: $runtime sec" >> ~/vllm/cllam/512-128/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 512         --gen_len 128         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/512-128/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 512         --gen_len 256         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/512-256
mv ~/vllm/data/* ~/vllm/cllam/512-256
echo "Runtime: $runtime sec" >> ~/vllm/cllam/512-256/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 512         --gen_len 256         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/512-256/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 512         --gen_len 512         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/512-512
mv ~/vllm/data/* ~/vllm/cllam/512-512
echo "Runtime: $runtime sec" >> ~/vllm/cllam/512-512/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 512         --gen_len 512         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/512-512/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 512         --gen_len 1024         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/512-1024
mv ~/vllm/data/* ~/vllm/cllam/512-1024
echo "Runtime: $runtime sec" >> ~/vllm/cllam/512-1024/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 512         --gen_len 1024         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/512-1024/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 1024         --gen_len 128         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/1024-128
mv ~/vllm/data/* ~/vllm/cllam/1024-128
echo "Runtime: $runtime sec" >> ~/vllm/cllam/1024-128/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 1024         --gen_len 128         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/1024-128/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 1024         --gen_len 256         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/1024-256
mv ~/vllm/data/* ~/vllm/cllam/1024-256
echo "Runtime: $runtime sec" >> ~/vllm/cllam/1024-256/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 1024         --gen_len 256         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/1024-256/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 1024         --gen_len 512         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/1024-512
mv ~/vllm/data/* ~/vllm/cllam/1024-512
echo "Runtime: $runtime sec" >> ~/vllm/cllam/1024-512/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 1024         --gen_len 512         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/1024-512/done

start=$(date +%s.%N)
python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 1024         --gen_len 1024         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4
end=$(date +%s.%N)
runtime=$(python -c "print(${end} - ${start})")

mv ~/vllm/cllam/trace ~/vllm/cllam/1024-1024
mv ~/vllm/data/* ~/vllm/cllam/1024-1024
echo "Runtime: $runtime sec" >> ~/vllm/cllam/1024-1024/done
echo "python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/         --tokenizer ~/data/models/vicuna-7b-v1.3/         --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json         --vllm_dir ~/vllm         --prompt_len 1024         --gen_len 1024         --repeat_num 1         --request_rate_params 2,32,2         --num_requests 1000         --tensor_parallel_size 4" >> ~/vllm/cllam/1024-1024/done
