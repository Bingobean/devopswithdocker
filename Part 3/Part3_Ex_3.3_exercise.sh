#!/bin/bash

GITHUB_REPO_URL="https://github.com/Bingobean/exercise3.3.git"
DOCKERHUB_USERNAME="potatogolem"
DOCKERHUB_PASSWORD="password-here"
DOCKERHUB_REPO_NAME="potatogolem/exercise_3.3"

download_repository() {
    git clone "$GITHUB_REPO_URL"
}

build_docker_image() {
    cd exercise3.3
    docker build -t "$DOCKERHUB_REPO_NAME" .
}

publish_to_dockerhub() {
    echo "$DOCKERHUB_PASSWORD" | docker login --username "$DOCKERHUB_USERNAME" --password-stdin
    docker push "$DOCKERHUB_REPO_NAME"
}

main() {
    download_repository

    build_docker_image

    publish_to_dockerhub
}

main