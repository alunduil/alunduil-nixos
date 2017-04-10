let
  hostNames = import ./hostNames.nix;

  node =
    { ... }:
    { networking.firewall.allowedTCPPorts = [ 2379 2380 ];
    
      services.etcd = {
        advertiseClientUrls = [ ("http://" + config.networking.hostName + ":2379") ];
        enable = true;
        initialCluster = map (h: "${h}=https://${h}:2380") hostNames;
        listenClientUrls = [ ("http://" + config.networking.hostName + ":2379") "http://localhost:2379" ];
        listenPeerUrls = [ ("http://" + config.networking.hostName + ":2380") ];
      };

      networking.bridges.cbr0.interfaces = [];
      networking.interfaces.cbr0 = {
        ipAddress = "10.10.0.1";
        prefixLength = 24;
      };

      virtualisation.docker = {
        enable = true;
        extraOptions = builtins.concatStringsSep " " [
          "--bridge=cbr0"
          "--ip-masq=false"
          "--iptables=false"
        ];
      };

      services.kubernetes.kubeconfig = {
        caFile = null;
        certFile = null;
        keyFile = null;
        server = "http://proxy";
      };

      services.kubernetes.kubelet = {
        clusterDomain = "local";
        enable = true;
      };
    };
in
  { network.description = "Kubernetes Cluster";
    
    proxy =
      { ... }:
      { networking.firewall.allowedTCPPorts = [ 80 ];

        services.nginx = {
          config = ''
          events {}

          http {
            upstream cronus {
            '' + builtins.concatStringsSep "" (map (h: "    server ${h};\n") hostNames) + ''
            }

            server {
              listen 80;

              location / {
                proxy_pass http://cronus;
              }
            }
          }
          '';
          enable = true;
        };
      };

  } // builtins.listToAttrs (map (h: { name = h; value = node; }) hostNames)
