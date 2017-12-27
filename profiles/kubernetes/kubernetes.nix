{ config, ... }:
{ services.dd-agent.tags =
    [ "kubernetes"
    ];

  services.kubernetes =
    { apiserver =
        { admissionControl = [ "LimitRanger"
                               "NamespaceLifecycle"
                               "ResourceQuota"
                               "ServiceAccount"
                             ];
          advertiseAddress = config.networking.hostName;
          authorizationMode = "ABAC";
        };

      kubelet =
        { enable = true;
        };
    };
}
