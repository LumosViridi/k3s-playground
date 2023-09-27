resource "kubernetes_namespace" "mysql_server" {
  metadata {
    annotations = {
      name = "mysql-server"
    }

    name = "mysql-server"
  }
}

resource "random_password" "mysql_server_root" {
  length           = 16
  lower            = true
  upper            = true
  numeric          = true
  special          = true
  min_lower        = 1
  min_upper        = 1
  min_numeric      = 1
  min_special      = 1
  override_special = "!*"
}

resource "kubernetes_secret_v1" "mysql_server_root" {
    metadata {
    name = "mysql-root-password"
    namespace = kubernetes_namespace.mysql_server.metadata.0.name
  }

  data = {
    password = random_password.mysql_server_root.result
  }

  type = "kubernetes.io/basic-auth"
}

# Apply all yaml files in mysql-server folder
resource "kubectl_manifest" "mysql_server" {
  for_each = fileset("${path.module}/../apps/mysql-server", "*.yaml")

  override_namespace = kubernetes_namespace.mysql_server.metadata.0.name
  yaml_body          = file("${path.module}/../apps/mysql-server/${each.value}")

  depends_on = [ kubernetes_secret_v1.mysql_server_root ]
}
