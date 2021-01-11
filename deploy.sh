#!/bin/bash

aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 210574254273.dkr.ecr.us-west-2.amazonaws.com && \
docker build -t client-assertions-api:$1 . && \
docker tag client-assertions-api:$1 210574254273.dkr.ecr.us-west-2.amazonaws.com/client-assertions-api:$1 && \
docker push 210574254273.dkr.ecr.us-west-2.amazonaws.com/client-assertions-api:$1 && \
echo "Latest Built Version: $1" > version.txt
