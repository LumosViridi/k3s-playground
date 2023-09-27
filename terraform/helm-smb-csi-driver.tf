resource "helm_release" "smb_csi_driver" {
  name             = "csi-driver-smb"
  repository       = "https://raw.githubusercontent.com/kubernetes-csi/csi-driver-smb/master/charts"
  chart            = "csi-driver-smb"
  namespace        = "kube-system"
  create_namespace = false
  version          = "1.12.0"
}
