{ config, ... }:
{ services.dd-agent.tags =
    [ "kubernetes"
    ];

  services.kubernetes =
    { kubelet.enable = true;
      proxy.enable = true;
    };
}
