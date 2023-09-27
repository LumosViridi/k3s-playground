# CSI Driver for SMB
https://github.com/kubernetes-csi/csi-driver-smb
## Create smb credentials secret for nodes

``` bash
kubectl create secret generic smbcreds --from-literal username=changeme --from-literal password="changeme"
```
