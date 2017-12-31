{ config, ... }:
{ services.dd-agent.tags =
    [ "kubernetes"
    ];

  networking.firewall.allowedTCPPorts =
    [ 443
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

      kubelet.enable = true;
      proxy.enable = true;

      scheduler =
        { address = "0.0.0.0";
          enable = true;
        };
    };
}
