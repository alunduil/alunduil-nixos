{ config, ... }:
{ services.etcd =
    { certFile = ./certificates/clients + "/${config.networking.hostName}.pem";
      clientCertAuth = true;
      initialCluster =
        [ "atropos=https://atropos:2380"
          "clothio=https://clothio:2380"
          "lachesis=https://lachesis:2380"
        ];
      keyFile = ./certificates/clients + "/${config.networking.hostName}-key.pem";
      peerCertFile = ./certificates/peers + "/${config.networking.hostName}.pem";
      peerClientCertAuth = true;
      peerKeyFile = ./certificates/peers + "/${config.networking.hostName}-key.pem";
      peerTrustedCaFile = ./certificates/peers/ca.pem;
      trustedCaFile = ./certificates/clients/ca.pem;
    };
}
