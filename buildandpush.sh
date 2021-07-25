#!/bin/bash

echo "Informe o seu user ocid:(ex. ocid1.user.oc1.._______dincoha)"

read clouduserocid

echo "Realizando login no Oracle Container Registry..."

docker login $(oci iam region-subscription list | grep -oP '(?<="region-key": ")[^"]*' | tr [:upper:] [:lower:]).ocir.io -u $(oci os ns get | grep -oP '(?<="data": ")[^"]*')/$(oci iam user get --user-id ${clouduserocid} | grep -oP '(?<="name": ")[^"]*')

echo "Construindo imagem de container..."

docker build . -t devopsapp:latest

echo "Aplicando tags de imagem..."

docker tag $(docker images -q devopsapp:latest) $(oci iam region-subscription list | grep -oP '(?<="region-key": ")[^"]*' | tr [:upper:] [:lower:]).ocir.io/$(oci os ns get | grep -oP '(?<="data": ")[^"]*')/devopsworkshop/devopsapp:latest

echo "Enviando imagem para repositório..."

docker push $(oci iam region-subscription list | grep -oP '(?<="region-key": ")[^"]*' | tr [:upper:] [:lower:]).ocir.io/$(oci os ns get | grep -oP '(?<="data": ")[^"]*')/devopsworkshop/devopsapp:latest

