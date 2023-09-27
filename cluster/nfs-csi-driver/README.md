# How to install

https://github.com/kubernetes-csi/csi-driver-nfs

``` bash
helm repo add csi-driver-nfs https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/master/charts
helm install csi-driver-nfs csi-driver-nfs/csi-driver-nfs --namespace kube-system --version v4.2.0
```

## Synology Settings

In the Shared folder settings, NFS permissions, create a new permission from the trusted subnet, with the following:
- privileged: read/write
- squash: Map all users to admin
- asynchronous: yes
- non-privileged: allowed
- cross-mount: allowed

Create a sub folder for each PV you want, and set the owner to `k8s` in the synology
