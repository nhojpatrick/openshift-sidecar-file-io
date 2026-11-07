#!/bin/sh

IMAGE_NAME=consumer ;
IMAGE_VERSION=latest ;

OC_NAMESPACE=images ;

docker build -t ${IMAGE_NAME}:${IMAGE_VERSION} . \
&& \
skopeo copy \
    --dest-tls-verify=false \
    --dest-creds=developer:`oc whoami -t` \
    docker-daemon:${IMAGE_NAME}:${IMAGE_VERSION} \
    docker://default-route-openshift-image-registry.apps-crc.testing/${OC_NAMESPACE}/${IMAGE_NAME}:${IMAGE_VERSION} ;
