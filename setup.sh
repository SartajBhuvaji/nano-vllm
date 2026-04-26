sudo apt update
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.12 python3.12-venv python3.12-dev

python3.12 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip wheel setuptools

# Install PyTorch
pip install "torch==2.6.*" --index-url https://download.pytorch.org/whl/cu124

# Prebuilt flash-attn wheel matching torch 2.6 / cu12 / py3.12 / abiFALSE
FA_WHL=flash_attn-2.7.4.post1+cu12torch2.6cxx11abiFALSE-cp312-cp312-linux_x86_64.whl
wget -q https://github.com/Dao-AILab/flash-attention/releases/download/v2.7.4.post1/$FA_WHL
pip install ./$FA_WHL

pip install -e .

hf download Qwen/Qwen3-0.6B --local-dir ~/huggingface/Qwen3-0.6B/

python example.py