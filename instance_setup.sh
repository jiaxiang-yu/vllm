#!/bin/bash

# install git-lfs if not already installed
install_git_lfs_if_not_exists() {
    pkg=git-lfs
    status="$(dpkg-query -W --showformat='${db:Status-Status}' "$pkg" 2>&1)"
    if [ ! $? = 0 ] || [ ! "$status" = installed ]; then
        echo 'git-lfs not found, installing git-lfs'

        # install git-lfs
        curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
        sudo apt-get install git-lfs
    else
        echo 'git-lfs found, skipping git-lfs installation'
    fi
}

# download data and models
download_data_and_models() {
    cd ~
    mkdir -p ~/data
    mkdir -p ~/data/models

    # download data
    cd ~/data
    wget https://huggingface.co/datasets/anon8231489123/ShareGPT_Vicuna_unfiltered/resolve/main/ShareGPT_V3_unfiltered_cleaned_split.json
    cd ~
    echo "Downloaded ShareGPT_V3_unfiltered_cleaned_split.json"

    # download models
    # need git-lfs
    install_git_lfs_if_not_exists
    cd ~/data/models
    git clone https://huggingface.co/lmsys/vicuna-7b-v1.3
    cd ~
    echo "Downloaded vicuna-7b-v1.3"
}

# install miniconda
install_miniconda() {
    echo 'installing miniconda'

    # install miniconda
    mkdir -p ~/miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm -rf ~/miniconda3/miniconda.sh
    # initialize
    ~/miniconda3/bin/conda init bash
    echo "conda installed, please restart shell"
}

# NOT IN USE
# install vllm
install_vllm() {
    cd ~/vllm

    git checkout 0.2.6-bench
    conda create -n vllm_0.2.6 python=3.9
    conda activate vllm_0.2.6
    pip install -e .

    echo "Installed vllm"
}

# NOT IN USE
# test run
test_run() {
    # test run
    python benchmarks/cllam/sweep.py --model ~/data/models/vicuna-7b-v1.3/ \
            --tokenizer ~/data/models/vicuna-7b-v1.3/ \
            --dataset ~/data/ShareGPT_V3_unfiltered_cleaned_split.json \
            --vllm_dir ~/vllm \
            --prompt_len 64 \
            --gen_len 64 \
            --repeat_num 1 \
            --request_rate_params 32,32,1 \
            --num_requests 100
}

# invoke each function
"$@"



# create env
conda create -n vllm_0.2.6 python=3.9
conda activate vllm_0.2.6
# install huggingface-cli
pip install -U "huggingface_hub[cli]"
# login
huggingface-cli login
# enter huggingface-cli login token


# download data and models
mkdir data
cd data
wget https://huggingface.co/datasets/anon8231489123/ShareGPT_Vicuna_unfiltered/resolve/main/ShareGPT_V3_unfiltered_cleaned_split.json

mkdir models
cd models
mkdir llama-2-70b-hf
huggingface-cli download meta-llama/Llama-2-70b-hf --local-dir llama-2-70b-hf

mkdir llama-2-7b-hf
huggingface-cli download meta-llama/Llama-2-7b-hf --local-dir llama-2-7b-hf

# install vllm
cd ~
git clone https://github.com/jiaxiang-yu/vllm.git
cd vllm
git checkout 0.2.6-bench
pip install -e .
