resource "kubernetes_namespace" "jellyfin" {
  metadata {
    annotations = {
      name = "jellyfin"
    }

    name = "jellyfin"
  }
}

# Apply all yaml files in jellyfin folder
resource "kubectl_manifest" "jellyfin" {
  for_each = fileset("${path.module}/../jellyfin", "*.yaml")

  override_namespace = kubernetes_namespace.jellyfin.metadata.0.name
  yaml_body          = file("${path.module}/../jellyfin/${each.value}")

  depends_on = [
    helm_release.metallb,
    kubectl_manifest.metallb
  ]
}
