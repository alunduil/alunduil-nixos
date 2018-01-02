{ config, ... }:
{ environment.etc =
    { "dd-agent/conf.d/etcd.yaml" =
        { text = ''
          init_config:

          instances:
            - url: "https://${config.networking.hostName}:2379"
              timeout: 5
              ssl_keyfile: ${config.services.etcd.keyFile}
              ssl_certfile: ${config.services.etcd.certFile}
              ssl_ca_certs: ${config.services.etcd.trustedCaFile}
          '';
        };
    };

  networking.firewall.allowedTCPPorts =
    [ 2379
      2380
    ];

  services.etcd =
    let clientScheme = "http" + (if config.services.etcd.certFile != null then "s" else "") + "://";
        peerScheme = "http" + (if config.services.etcd.peerCertFile != null then "s" else "") + "://";
    in
      { advertiseClientUrls =
          [ (clientScheme + config.networking.hostName + ":2379")
          ];
        enable = true;
        listenClientUrls =
          [ (clientScheme + config.networking.hostName + ":2379")
            (clientScheme + "localhost:2379")
          ];
        listenPeerUrls =
          [ (peerScheme + config.networking.hostName + ":2380")
          ];
      };

  services.dd-agent.tags =
    [ "etcd"
    ];
}
