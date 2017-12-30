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
