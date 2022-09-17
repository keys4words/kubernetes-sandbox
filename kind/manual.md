# cluster
kind get clusters
kind create/delete cluster --name <cluster-name>
kind create cluster --config kind-example-config.yaml

# cluster in kubectl
k cluster-info --context <cluster-name>

# manual deploy
k create deployment web --image=nginx
k expose deploy web --port=80
k port-forward service/web 1234:80