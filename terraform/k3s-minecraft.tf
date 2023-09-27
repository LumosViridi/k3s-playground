resource "kubernetes_namespace" "minecraft" {
  metadata {
    annotations = {
      name = "minecraft"
    }

    name = "minecraft"
  }
}

# Apply all yaml files in minecraft folder
resource "kubectl_manifest" "minecraft" {
  for_each = fileset("${path.module}/../apps/minecraft", "*.yaml")

  override_namespace = kubernetes_namespace.minecraft.metadata.0.name
  yaml_body          = file("${path.module}/../apps/minecraft/${each.value}")

  depends_on = [helm_release.smb_csi_driver]
}
