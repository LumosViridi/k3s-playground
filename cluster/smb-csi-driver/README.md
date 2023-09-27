# Create smb credentials secret for nodes

``` bash
kubectl create secret generic smbcreds --from-literal username=changeme --from-literal password="changeme"
```
