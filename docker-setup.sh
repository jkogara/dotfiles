#!/bin/bash
eval "$(docker-machine env default)"

function docker-login-personal(){
  `aws ecr get-login --region us-east-1 --profile personal`
}

function docker-tag-latest-personal(){
  docker tag swiss-pairing:latest 055257691102.dkr.ecr.us-east-1.amazonaws.com/swiss-pairing:latest
}

function docker-push-personal(){
  docker push 055257691102.dkr.ecr.us-east-1.amazonaws.com/swiss-pairing:latest
}
