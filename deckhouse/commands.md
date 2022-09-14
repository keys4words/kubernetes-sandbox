# create cluster
kind create cluster --image "kindest/node:v1.23.6@sha256:51d988ac40b04965b5379e251a113cdd44150b758ae339b0e941769e584040f5" --config kind.cfg

# deploy Deckhouse platform
docker run --pull=always  --network host -it -v "$PWD/config.yml:/config.yml" -v "$HOME/.ssh/:/tmp/.ssh/" \
  -v "$HOME/.kube/config:/kubeconfig" registry.deckhouse.io/deckhouse/ce/install:stable bash

# run installer script inside container
dhctl bootstrap-phase install-deckhouse --kubeconfig=/kubeconfig --config=/config.yml

# 