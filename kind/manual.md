# cluster
kind get clusters
kind create/delete cluster --name <cluster-name>
kind create cluster --config kind-example-config.yaml

# cluster in kubectl
k cluster-info --context <cluster-name>

# add traefik ingress
helm repo add traefik https://helm.traefik.io/traefik
helm repo update
helm install traefik traefik/traefik

# configure traefik - add externalIPs: <internal kind-control-plane ip>
k edit svc traefik

# manual deploy
k create deployment web --image=nginx
k expose deploy web --port=80
k port-forward service/web 1234:80

# deploy colored page
k create deploy red --image=jpetazzo/webcolor
k expose deploy red --port=8000
k create ingress red --rule=red.localtest.me/*=red:8000

# kustomize
kustomize build <path-to-folder> | kubectl apply -f -