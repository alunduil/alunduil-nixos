{ ... }:
{ services.etcd =
    { certFile = certificates/etcd.pem;
      clientCertAuth = true;
      initialCluster =
        [ "atropos=https://atropos:2380"
          "clothio=https://clothio:2380"
          "lachesis=https://lachesis:2380"
        ];
      keyFile = certificates/etcd.key;
      peerCertFile = certificates/etcd-peer.pem;
      peerClientCertAuth = true;
      peerKeyFile = certificates/etcd-peer.key;
      peerTrustedCaFile = certificates/ca.pem;
      trustedCaFile = certificates/ca.pem;
    };
}
