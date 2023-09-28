# CSI Driver for SMB

After messing with this for hours and finally getting it working, I've decided to switch to Helm. 

<https://github.com/kubernetes-csi/csi-driver-smb>

## Create smb credentials secret for nodes

``` bash
kubectl create secret generic smbcreds --from-literal username=changeme --from-literal password="changeme"
```
