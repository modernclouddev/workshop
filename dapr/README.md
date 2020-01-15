

## Install Dapr on Kubernetes

```bash

helm repo add dapr https://daprio.azurecr.io/helm/v1/repo

helm repo update

kubectl create ns dapr-system

helm install dapr dapr/dapr --namespace dapr-system

kubectl get pods -n dapr-system

```