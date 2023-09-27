# Apply all yaml files in nfs-csi folder
resource "kubectl_manifest" "nfs_csi_driver" {
  for_each = fileset("${path.module}/../cluster/nfs-csi-driver", "*.yaml")

  yaml_body = file("${path.module}/../cluster/nfs-csi-driver/${each.value}")

  depends_on = [helm_release.nfs_csi_driver]
}
