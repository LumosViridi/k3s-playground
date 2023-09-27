# Apply all yaml files in metallb folder
resource "kubectl_manifest" "metallb" {
  for_each = fileset("${path.module}/../cluster/metallb", "*.yaml")

  override_namespace = helm_release.metallb.namespace
  yaml_body          = file("${path.module}/../cluster/metallb/${each.value}")

  depends_on = [helm_release.metallb]
}
