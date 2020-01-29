```bash

kubectl create secret generic cosmos-db-secret -n hackfest \
--from-literal=user=cdw-modernclouddev-20200111-db \
--from-literal=pwd=MY_COSMOS_DB_KEY \
--from-literal=appinsights=InstrumentationKey=MY_APP_INSIGHTS_KEY

helm install data-api ./data-api --namespace hackfest --set deploy.acrServer=cdwmodernclouddev20200111acr.azurecr.io
helm install flights-api ./flights-api --namespace hackfest --set deploy.acrServer=cdwmodernclouddev20200111acr.azurecr.io
helm install quakes-api ./quakes-api --namespace hackfest --set deploy.acrServer=cdwmodernclouddev20200111acr.azurecr.io
helm install weather-api ./weather-api --namespace hackfest --set deploy.acrServer=cdwmodernclouddev20200111acr.azurecr.io
helm install service-tracker-ui ./service-tracker-ui --namespace hackfest --set deploy.acrServer=cdwmodernclouddev20200111acr.azurecr.io

```