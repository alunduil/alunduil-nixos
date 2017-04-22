hostNames:
{ config, ... }:
{ imports =
    [ ../../common.nix
      ./docker.nix
      ./etcd
      ./kubernetes.nix
    ];
    
  services.etcd.initialCluster = map (h: "${h}=http://${h}:2380") hostNames;
}
