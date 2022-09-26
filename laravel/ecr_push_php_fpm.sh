#!/bin/bash

GIT_COMMIT_ID=$(git log --format="%H" -n 1)
aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 806467626197.dkr.ecr.ap-northeast-1.amazonaws.com
docker build -t zenn-backend-phpfpm:"${GIT_COMMIT_ID}" -f ./infra/php/Dockerfile .
docker tag zenn-backend-phpfpm:"${GIT_COMMIT_ID}" 806467626197.dkr.ecr.ap-northeast-1.amazonaws.com/zenn-php-fpm:"${GIT_COMMIT_ID}"
docker push 806467626197.dkr.ecr.ap-northeast-1.amazonaws.com/zenn-php-fpm:"${GIT_COMMIT_ID}"
