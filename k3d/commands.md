k3d cluster create cl001 --agents 2 --servers 1
# add new working node to existing cluster
k3d node create additional_agent --role agent --cluster cl001


# kenneth reitz's example
k apply -f kennethreitz.yaml
echo "$(minikube ip) myhost.com" >> /etc/hosts