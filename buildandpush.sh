#!/bin/bash

docker build . -t devopsapp:latest

docker tag $(docker images -q devopsapp:latest) $(oci iam region-subscription list | grep -oP '(?<="region-key": ")[^"]*' | tr [:upper:] [:lower:]).ocir.io/$(oci os ns get | grep -oP '(?<="data": ")[^"]*')/devopsworkshop/devopsapp:latest

docker push $(oci iam region-subscription list | grep -oP '(?<="region-key": ")[^"]*' | tr [:upper:] [:lower:]).ocir.io/$(oci os ns get | grep -oP '(?<="data": ")[^"]*')/devopsworkshop/devopsapp:latest

