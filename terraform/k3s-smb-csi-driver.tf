# Apply all yaml files in nfs-csi folder
resource "kubectl_manifest" "smb_csi_driver" {
  for_each = fileset("${path.module}/../smb-csi-driver", "*.yaml")

  yaml_body          = file("${path.module}/../smb-csi-driver/${each.value}")

  depends_on = [ helm_release.smb_csi_driver ]
}
