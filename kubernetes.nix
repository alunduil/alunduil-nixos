let
  etcd = import ./services/etcd.nix;

  kubernetesNode = 
    { config, pkgs, ... }:
    { networking.bridges.cbr0.interfaces = [];
      networking.interfaces.cbr0 =
        { ipAddress = "10.10.0.1";
          prefixLength = 24;
        };

      services.kubernetes.roles = [ "master" "node" ];
      virtualisation.docker.extraOptions = ''--iptables=false --ip-masq=false =b cbr0'';
    };

in

{ network.description = "Kubernetes Cluster";

  demeter  = etcd;
  hades    = etcd;
  hera     = etcd;
  hestia   = etcd;
  poseidon = etcd;
  zeus     = etcd;
}
