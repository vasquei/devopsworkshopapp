#!/bin/bash
kubectl create namespace dev
kubectl create namespace prod

kubectl create secret -n dev generic ocir --from-file=.dockerconfigjson=../.docker/config.json --type=kubernetes.io/dockerconfigjson

kubectl create secret -n prod generic ocir --from-file=.dockerconfigjson=../.docker/config.json --type=kubernetes.io/dockerconfigjson
