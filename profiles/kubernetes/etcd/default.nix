{ config, ... }:
{ environment.etc =
    { "dd-agent/conf.d/etcd.yaml" =
        { source = ./etcd.yaml;
        };
    };

  networking.firewall.allowedTCPPorts =
    [ 2379
      2380
    ];

  services.etcd =
    { advertiseClientUrls =
        [ ("https://" + config.networking.hostName + ":2379")
        ];
      certFile = ../../certificates/cronus-kubernetes.pem;
      clientCertAuth = true;
      keyFile = ../../certificates/cronus-kubernetes-key.pem;
      enable = true;
      listenClientUrls =
        [ ("https://" + config.networking.hostName + ":2379")
          "https://localhost:2379"
        ];
      listenPeerUrls =
        [ ("https://" + config.networking.hostName + ":2380")
        ];
      peerCertFile = ../../certificates/cronus-kubernetes.pem;
      peerClientCertAuth = true;
      peerKeyFile = ../../certificates/cronus-kubernetes-key.pem;
      peerTrustedCaFile = ../../certificates/alunduil-ca.pem;
      trustedCaFile = ../../certificates/alunduil-ca.pem;
    };

  services.dd-agent.tags =
    [ "etcd"
    ];
}
