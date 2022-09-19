k apply -f web-deployment.yaml
k apply -f web-service.yaml
k apply -f backend-deployment.yaml
k apply -f backend-service.yaml

curl k8s1-5:31000