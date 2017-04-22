{ pkgs, ... }:
{ services.dd-agent.tags =
    [ "kubernetes"
    ];

  services.kubernetes =
    { kubeconfig =
        { caFile = null;
          certFile = null;
          keyFile = null;
          server = "http://cronus";
        };

      kubelet =
        { clusterDomain = "kubernetes";
          enable = true;
        };
    };
}
