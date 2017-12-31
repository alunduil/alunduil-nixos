{ config, ... }:
{ services.kubernetes =
    { apiserver =
        { kubeletClientCertFile = ./certificates + "/${config.networking.hostName}.pem";
          kubeletClientKeyFile = ./certificates + "/${config.networking.hostName}-key.pem";
          serviceAccountKeyFile = ./certificates/ca-key.pem;
          tlsCertFile = ./certificates + "/${config.networking.hostName}.pem";
          tlsKeyFile = ./certificates + "/${config.networking.hostName}-key.pem";
        };
      
      caFile = ./certificates/ca.pem;

      controllerManager =
        { rootCaFile = ./certificates/ca.pem;
          serviceAccountKeyFile = ./certificates/ca-key.pem;
        };

      etcd =
        { caFile = ../etcd/certificates/clients/ca.pem;
          certFile = ../etcd/certificates/clients + "/${config.networking.hostName}.pem";
          keyFile = ../etcd/certificates/clients + "/${config.networking.hostName}-key.pem";
          servers =
            [ "https://atropos:2379"
              "https://clothio:2379"
              "https://lachesis:2379"
            ];
        };

      kubeconfig =
        { certFile = ./certificates + "/${config.networking.hostName}.pem";
          keyFile = ./certificates + "/${config.networking.hostName}-key.pem";
          server = "http://fates";
        };
      
      proxy.kubeconfig =
        { certFile = ./certificates/proxy.pem;
          keyFile = ./certificates/proxy-key.pem;
        };
    };
}
