{ config, ... }:
{ services.dd-agent.tags =
    [ "kubernetes"
    ];

  services.kubernetes =
    { apiserver.enable = true;
      controllerManager.enable = true;
      kubelet.enable = true;
      proxy.enable = true;
      scheduler.enable = true;
    };
}
