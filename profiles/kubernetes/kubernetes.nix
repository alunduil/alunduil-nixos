{ config, pkgs, ... }:
{ networking.firewall.allowedTCPPorts =
    [ 443
    ];

  environment =
    { systemPackages =
        [ pkgs.socat
        ];
    };

  services.dd-agent.tags =
    [ "kubernetes"
    ];

  services.kubernetes =
    { apiserver =
        { address = "0.0.0.0";
          admissionControl =
            [ "DefaultStorageClass"
              "Initializers"
              "LimitRanger"
              "NamespaceLifecycle"
              "NodeRestriction"
              "ResourceQuota"
              "ServiceAccount"
            ];
          # advertiseAddress = config.networking.hostName;
          authorizationMode =
            [ # "Node"
              "RBAC"
            ];
          enable = true;
          runtimeConfig = "api/all";
        };

      controllerManager =
        { address = "0.0.0.0";
          enable = true;
        };

      kubelet =
        { enable = true;
          extraOpts = ''
          --anonymous-auth=false
          '';
          networkPlugin = "cni";
        };

      proxy.enable = true;

      scheduler =
        { address = "0.0.0.0";
          enable = true;
        };
    };
}
