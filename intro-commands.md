kubectl cluster-info
kubectl create deployment <name> --image=<image-url> --register
kubectl create -f pod-definition.yml

kubectl run <pod_name> --image <image_from_dockerhub>

kubectl get nodes/po/svc/rs/deploy/ds/cronjob/cm/secret
kubectl get nodes -o wide
kubectl get event --field-selector involvedObject.name=myapp-pod

kubectl describe pods/deployment <name>

kubectl logs <pod_name> <container_name>
kubectl exec -it <pod_name> -- bash
kubectl exec <pod_name> -- command (ex: printenv)

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
kubectl rollout history deploy <deployment-name>        --revision=3
kubectl edit deploy <deployement-name> --record

# copy from/to pod
kubectl cp {{namespace}}/{{podname}}:path/to/directory /local/path  # copy file from pod
kubectl cp /local/path namespace/podname:path/to/directory          # copy file to pod

# port forwarding #
kubectl port-forward <pod-name> 20001:80

# secret #
kubectl create secret generic/docker-registry/tls <secret-name> --from-literal=key=value
kubectl create secret generic user-creds --from-file=.\secrets\username.txt --from-file=.\secrets\password.txt

# curl in cluster #
kubectl run curl --image=radial/busyboxplus:curl -i --tty
kubectl attach curl -c curl -it

kubectl run -it --rm --generator run-pod/v1 test --image centosadmin/utils --bash

k run -it --rm --image alpine -- sh
apk add curl --update

# ip a & ping in nginx
apt update && apt install iproute2 iputils-ping

# show secret
kubectl get secret <secret-name> -oyaml -> base64 --decode

# drain/cordon node
kubectl drain <node-name> --ignore-daemonset
kubectl uncordon <node-name> -> make node available for scheduler
kubectl cordon <node-name> -> mark node for preventing new scheduling

# dashboard #
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.5.0/aio/deploy/recommended.yaml

kubectl -n kubernetes-dashboard create token admin-user
kubectl proxy

http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/

# roles - check access
k auth can-i get/delete/create po/node -n default --as <user-name>

# service naming
<svc-name>.<namespace>.svc.cluster.local

# create service
kubectl expose pod redis --port=6379 --name redis-service --dry-run=client -o yaml
kubectl expose pod nginx --type=NodePort --port=80 --name=nginx-service --dry-run=client -o yaml

# create configmaps
kubectl create configmap <name-of-cm> --from-literal=<key>=<value> | --from-file=<path-to-file>

# taints & tolerations
kubectl taint nodes <node-name> key=value:NoSchedule|PreferNoSchedule|NoExecute

# label
kubectl label nodes <node-name> key=value

# context & config
kubectl config view --kubeconfig=<config-name>
kubectl config get-contexts
kubectl config current-context
kubectl config use-context <cluster-name>
kubectl config set-context <context-name>

# generate yaml
k run nginx/deploy --image=nginx --dry-run=client -o yaml

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
helm search repo <repo-name>
# add a chart repo
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo list
# install chart
helm install <release-name> <chart-name|or-chart-folder-path>
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