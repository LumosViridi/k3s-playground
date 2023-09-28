# How to install

After messing with this for hours and finally getting it working, I've decided to switch to Helm.

## CSI Driver for NFS

<https://github.com/kubernetes-csi/csi-driver-nfs>

``` bash
helm repo add csi-driver-nfs https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/master/charts
helm install csi-driver-nfs csi-driver-nfs/csi-driver-nfs --namespace kube-system --version v4.2.0
```
