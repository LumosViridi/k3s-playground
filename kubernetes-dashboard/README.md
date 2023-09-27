# Logging into the Kubernetes Dashboard

Get login token via

``` bash
SECRET_NAME="admin-user-token"
TOKEN=$(kubectl -n kubernetes-dashboard get secret ${SECRET_NAME} -o jsonpath='{$.data.token}' | base64 -d | sed $'s/$/\\\n/g')
echo $TOKEN
```
