#!/bin/bash

echo "Informe o seu user ocid:(ex. ocid1.user.oc1.._______dincoha)"
read clouduserocid
echo "Informe o seu Auth Token:"
read authtoken
echo "$(oci os ns get | grep -oP '(?<="data": ")[^"]*')/$(oci iam user get --user-id ${clouduserocid} | grep -oP '(?<="name": ")[^"]*')"
kubectl create secret docker-registry ocir --docker-server=$(oci iam region-subscription list | grep -oP '(?<="region-key": ")[^"]*' | tr [:upper:] [:lower:]).ocir.io \
--docker-username= $(oci os ns get | grep -oP '(?<="data": ")[^"]*')/$(oci iam user get --user-id ${clouduserocid} | grep -oP '(?<="name": ")[^"]*') \
--docker-password='${authtoken}' \
--docker-email='example@example.com'