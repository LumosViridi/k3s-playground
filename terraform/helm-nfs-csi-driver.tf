resource "helm_release" "nfs_csi_driver" {
  name             = "nfs-csi-driver"
  repository       = "https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/master/charts"
  chart            = "csi-driver-nfs"
  namespace        = "kube-system"
  create_namespace = false
  version          = "v4.2.0"
}
