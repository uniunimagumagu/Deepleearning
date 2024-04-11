# ベースイメージの指定
FROM nvidia/cuda:11.6.2-cudnn8-devel-ubuntu20.04



# 環境変数の設定
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# 必要なパッケージのインストール
RUN apt-get update --fix-missing && \
    apt-get install -y \
    python3.7 \
    python3-pip \
    wget \
    bzip2 \
    ca-certificates \
    curl \
    git \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
    apt install libgl1-mesa-glx \
    apt-get install libgl1-mesa-glx \
    apt-get install -y libglib2.0-0
    # apt-get install libglib2.0-0
# Pythonパッケージのインストール
RUN pip install --upgrade pip && \
    pip install tensorflow keras pandas \
    pip install grad-cam \
    pip install --upgrade numpy


# 作業ディレクトリの設定
WORKDIR /app

# 実行コマンドの設定
CMD ["/bin/bash"]
