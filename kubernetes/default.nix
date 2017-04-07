let
  hostNames = import ./kubernetes-hostnames.nix;

  node = etcd;

  etcd = 
    { ... }: 
    { imports = [ ./services/etcd.nix ];
      services.etcd.initialCluster = builtins.map (h: "${h}=http://${h}:2380") hostNames;
    };

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
  } // builtins.listToAttrs (builtins.map (h: { name = h; value = node; }) hostNames)
