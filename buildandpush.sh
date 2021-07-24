#!/bin/bash

docker build . -t devopsapp:latest

IMAGEID= $(docker images -q devopsapp:latest)
REGION= $(oci iam region-subscription list | grep -oP '(?<="region-name": ")[^"]*')
NAMESPACE= $(oci os ns get | grep -oP '(?<="data": ")[^"]*')


docker tag $IMAGEID $REGION.ocir.io/$NAMESPACE/devopsworkshop/devopsapp:latest

docker push $REGION.ocir.io/$NAMESPACE/devopsworkshop/devopsapp:latest