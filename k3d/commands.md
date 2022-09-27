# create simple cluster
k3d cluster create demo --agents 2
# info "--port 8080:80@loadbalancer: map localhost:8080 to port 80 on the loadbalancer (used for ingress)"
# info "--volume $(pwd)/sample:/src@all: mount the sub directory sample of the current directory to /src in all nodes (used for code)"
# info "--wait: wait for all server nodes to be up before returning"
k3d cluster create demo --api-port 6550 --servers 1 --agents 3 --port 8080:80@loadbalancer --volume $(pwd)/sample:/src@all --wait
# add new working node to existing cluster
k3d node create new_agent --role agent --cluster demo --replicas 2
# update the default kubeconfig with the new cluster details
# info "--kubeconfig-merge-default true: overwrite existing fields with the same name in kubeconfig (true by default)"
# info "--kubeconfig-switch-context true: set the kubeconfig's current-context to the new cluster context (false by default)"
k3d kubeconfig merge demo --kubeconfig-merge-default --kubeconfig-switch-context
# operations with cluster
k3d cluster start/stop/delete demo
# create cluster with file
k3d cluster create --config ./myconf.yml
# dashboard - http://localhost:9000/dashboard/
k port-forward traefik-xx-xx -n kube-system 9000:9000
# manual deploy
k create deploy nginx --image nginx
k expose deploy nginx --port 80
k apply -f ingress.yaml