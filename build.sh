#!/bin/bash

docker build . -t circleci-deploy-container
docker run -i --entrypoint=/bin/bash -t circleci-deploy-container
