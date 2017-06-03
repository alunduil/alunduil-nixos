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
          clientCaFile = ../../certificates/alunduil-ca.pem;
        };

      kubeconfig =
        { caFile = ../../certificates/alunduil-ca.pem;
          certFile = ../../certificates/cronus-proxy.pem;
          keyFile = ../../certificates/cronus-proxy-key.pem;
        };

      kubelet =
        { clusterDomain = "kubernetes";
          enable = true;
        };
    };
}
