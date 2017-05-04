{ ... }:
{ services.dd-agent.tags =
    [ "kubernetes"
    ];

  services.kubernetes =
    { kubeconfig =
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
