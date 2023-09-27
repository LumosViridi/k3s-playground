resource "kubernetes_namespace" "uptime_kuma" {
  metadata {
    annotations = {
      name = "uptime-kuma"
    }

    name = "uptime-kuma"
  }
}

# Apply all yaml files in uptime kuma folder
resource "kubectl_manifest" "uptime_kuma" {
  for_each = fileset("${path.module}/../apps/uptime-kuma", "*.yaml")

  override_namespace = kubernetes_namespace.uptime_kuma.metadata.0.name
  yaml_body          = file("${path.module}/../apps/uptime-kuma/${each.value}")
}
