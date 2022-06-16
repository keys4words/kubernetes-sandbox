#!/bin/bash

if [ $1 = "deploy" ]; then
    kubectl create -f voting-app-pod.yaml
    kubectl create -f voting-app-service.yaml

    kubectl create -f redis-pod.yaml
    kubectl create -f redis-service.yaml
    # kubectl get pods, svc

    kubectl create -f postgres-pod.yaml
    kubectl create -f postgres-service.yaml

    kubectl create -f worker-app-pod.yaml

    kubectl create -f result-app-pod.yaml
    kubectl create -f result-app-service.yaml

    minikube service voting-service --url
    minikube service result-service --url
elif [ $1 = "delete" ]; then
    kubectl delete -f voting-app-service.yaml
    kubectl delete -f voting-app-pod.yaml

    kubectl delete -f redis-service.yaml
    kubectl delete -f redis-pod.yaml

    kubectl delete -f postgres-service.yaml
    kubectl delete -f postgres-pod.yaml

    kubectl delete -f worker-app-pod.yaml

    kubectl delete -f result-app-service.yaml
    kubectl delete -f result-app-pod.yaml
fi