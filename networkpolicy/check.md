minikube start --cni calico

kubectl run app --image nicolaka/netshoot --labels="app=app" -- /bin/bash -c "sleep 3600"

kubectl run db --image postgres --labels="app=database" --env="POSTGRES_PASSWORD=123"

kubectl get po -owide
kubectl exec -it app -- bash
telnet <ip-db-pod> 5432