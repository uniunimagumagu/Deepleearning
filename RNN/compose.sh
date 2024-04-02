#!/bin/bash -eu

# スクリプトが存在するディレクトリを基準に、docker-composeコマンドを実行する
SCRIPT_DIR=$(dirname $(readlink -f $0))
cd $SCRIPT_DIR

function build() {
    docker build -t resnet_training .
}

function up() {
    docker compose up -d "$@"
}

function exec() {
    # コンテナ名を引数として受け取る。デフォルトは ml-agents
    local container_name=${1:-resnet_training}
    docker compose exec $container_name bash
}

function down() {
    docker compose down "$@"
}

function main() {
    local subcommand=$1
    if [[ -z "$subcommand" ]]; then
        echo "Usage: ./compose.sh [build|up|exec|down]"
        exit 1
    fi

    # サブコマンドに応じて関数を呼び出す
    case "$subcommand" in
        build)
            build
            ;;
        up)
            shift # 最初の引数（サブコマンド）を除去
            up "$@"
            ;;
        exec)
            shift
            exec "$@"
            ;;
        down)
            shift
            down "$@"
            ;;
        *)
            echo "Invalid command: $subcommand"
            echo "Usage: ./compose.sh [build|up|exec|down]"
            exit 1
            ;;
    esac
}

main "$@"
