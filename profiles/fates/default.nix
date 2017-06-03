{ ... }:
{ imports =
    [ ./etcd.nix
      ./kubernetes.nix
      ../kubernetes
    ];
}
