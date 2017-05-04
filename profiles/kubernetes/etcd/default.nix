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
        [ ("http://" + config.networking.hostName + ":2379")
        ];
      enable = true;
      listenClientUrls =
        [ ("http://" + config.networking.hostName + ":2379")
          "http://localhost:2379"
        ];
      listenPeerUrls =
        [ ("http://" + config.networking.hostName + ":2380")
        ];
    };

  services.dd-agent.tags =
    [ "etcd"
    ];
}
