kubectl create -f voting-app-deploy.yaml
kubectl create -f voting-app-service.yaml
sleep 2
kubectl create -f redis-deploy.yaml
kubectl create -f redis-service.yaml
sleep 2
kubectl create -f postgres-deploy.yaml
kubectl create -f postgres-service.yaml
sleep 3
kubectl create -f worker-app-deploy.yaml
sleep 1
kubectl create -f result-app-deploy.yaml
kubectl create -f result-app-service.yaml
sleep 3
minikube service voting-service --url
minikube service result-service --url
# kubectl scale deployment voting-app-deploy --replicas=3