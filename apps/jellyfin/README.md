# Jellyfin

There is a great guide on how to deploy Jellyfin on Kubernetes using Terraform [here](https://wiki.ravianand.me/en/home-server/apps/media-server/jellyfin). I'm not the biggest fan of his layout so you'll notice that I've done some things a bit differently regarding Terraform.

The Kubernetes provider for Terraform allows a lot of dynamic control over resources, however when that's not needed it feels a bit overbearing to convert already working YAML Manifests to specific Terraform resources. To me it made more sense to use the kubectl Terraform provider to loop over files in a folder to apply manifests.

[Jellyfin GitHub](https://github.com/jellyfin/jellyfin)

[Jellyfin Docs](https://jellyfin.org/docs/)
