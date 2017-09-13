{ ... }:
{ imports =
    [ ./docker.nix
      ./etcd
      ./kubernetes.nix
    ];
}
