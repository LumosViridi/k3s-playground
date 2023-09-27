#MetalLB
## MetalLB Requires you to uninstall Traefik:

If you have any issues with doing this, here’s a good reference:

[Uninstall Traefik on existing cluster](https://github.com/k3s-io/k3s/issues/1160#issuecomment-1299212589)


    helm -n kube-system delete traefik traefik-crd
    kubectl -n kube-system delete helmchart traefik traefik-crd
    # Run from where helm is installed, i.e laptop

    touch /var/lib/rancher/k3s/server/manifests/traefik.yaml.skip
    systemctl restart k3s
    # Run from the k3s server node, r2d2-1 or master for example

We also need to remove ServiceLB and Traefik from any servers in the cluster

    curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable servicelb --disable traefik" sh -

The command above removes ServiceLB and Traifik so it’s probably a little redundant.

[MetalLB Docs Page](https://metallb.universe.tf/installation/#installation-by-manifest)