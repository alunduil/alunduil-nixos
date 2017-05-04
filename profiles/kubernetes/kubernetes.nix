{ ... }:
{ services.dd-agent.tags =
    [ "kubernetes"
    ];

  services.kubernetes =
    { kubeconfig =
        { caFile = null;
          certFile = null;
          keyFile = null;
        };

      kubelet =
        { clusterDomain = "kubernetes";
          enable = true;
        };
    };
}
