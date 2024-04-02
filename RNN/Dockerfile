# 基本イメージとしてPyTorch公式イメージを使用
FROM pytorch/pytorch:1.7.1-cuda11.0-cudnn8-runtime

# 作業ディレクトリを設定
WORKDIR /workspace

# 必要なPythonパッケージをインストール
RUN pip install numpy matplotlib


# コンテナ起動時に実行するコマンド
CMD ["/bin/bash"]