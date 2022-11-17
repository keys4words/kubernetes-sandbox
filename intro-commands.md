kubectl cluster-info
kubectl create deployment <name> --image=<image-url> --register
kubectl create -f pod-definition.yml

kubectl run <pod_name> --image <image_from_dockerhub>

kubectl get nodes/po/svc/rs/deploy/ds
kubectl get nodes -o wide

kubectl describe pods/deployment <name>

kubectl logs <pod_name>
kubectl exec -it <pod_name> -- bash

kubectl delete service/replicaset
kubectl delete all --all

# scaling #
kubectl replace -f replicaset-definition.yml
kubectl scale --replicas=6 -f replicaset-definition.yml
kubectl scale --replicas=6 replicaset myapp-replicaset

# setting #
kubectl set image replicaset/name-of-rs name-of-cont=image-name:version

# rollout commands
kubectl rollout status <deployment_name>
kubectl rollout undo deployment <deployment_name> --to-revision=2
kubectl rollout history deploy <deployment-name>

# port forwarding #
kubectl port-forward <pod-name> 20001:80

# secret #
kubectl create secret generic/docker-registry/tls <secret-name> --from-literal=key=value

# curl in cluster #
kubectl run curl --image=radial/busyboxplus:curl -i --tty
kubectl attach curl -c curl -it

kubectl run -it --rm --generator run-pod/v1 test --image centosadmin/utils --bash

k run -it --rm --image alpine -- sh
apk add curl --update

# dashboard #
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.0/aio/deploy/recommended.yaml

kubectl -n kubernetes-dashboard create token admin-user
kubectl proxy

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

## minikube
minikube start/delete/status
minikube ssh -i ~/.minikube/machines/minikube/id_rsa docker@192.168.99.100
minikube service <service_name>
minikube dashboard
minikube ip
minikube logs


## helm
# find chart to install
helm search hub <what-i-search>
# add a chart repo
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo list
# install chart
helm install --set grafana.replicaCount=2 grafana bitnami/grafana
# show list of charts
helm list
# show details about chart
helm status <chart-name>
# upgrade/delete installation
helm upgrade grafana
helm upgrade --install sample-app sample/conf/charts/sample-app --namespace demo --set app.image=sample-app:local
# rollback
helm rollback grafana <revision-number>
# create helm chart
helm create <name>
# package helm chart
helm package <name-package>