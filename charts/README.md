```bash

kubectl create secret generic cosmos-db-secret -n hackfest \
--from-literal=user=cdw-modernclouddev-20200111-db \
--from-literal=pwd=MBkxXHgswN5XGmIPNhHw1ipGD0CJAgqVmEMwx2SPL8skEqWIZN3KY2jL8oUCW2V6aq51FdxLhcYDzneiTcBksg== \
--from-literal=appinsights=InstrumentationKey=48b18e69-0eff-4af0-ae40-141dbb6fc237 

helm install data-api ./data-api --namespace hackfest --set deploy.acrServer=cdwmodernclouddev20200111acr.azurecr.io
helm install flights-api ./flights-api --namespace hackfest --set deploy.acrServer=cdwmodernclouddev20200111acr.azurecr.io
helm install quakes-api ./quakes-api --namespace hackfest --set deploy.acrServer=cdwmodernclouddev20200111acr.azurecr.io
helm install weather-api ./weather-api --namespace hackfest --set deploy.acrServer=cdwmodernclouddev20200111acr.azurecr.io
helm install service-tracker-ui ./service-tracker-ui --namespace hackfest --set deploy.acrServer=cdwmodernclouddev20200111acr.azurecr.io

```