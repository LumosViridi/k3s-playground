# Apply all yaml files in kubernetes dashboard folder
resource "kubectl_manifest" "kubernetes_dashboard" {
  for_each = fileset("${path.module}/../apps/kubernetes-dashboard", "*.yaml")

  override_namespace = helm_release.kubernetes_dashboard.namespace
  yaml_body          = file("${path.module}/../apps/kubernetes-dashboard/${each.value}")
}