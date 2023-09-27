#############
# Providers #
#############
provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

####################
# Terraform Config #
####################
terraform {
  required_version = ">= 1.5.7"
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.11.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.23.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
  }

  cloud {
    organization = "CiaraHatcher"

    workspaces {
      name = "k3s-playground"
    }
  }
}
