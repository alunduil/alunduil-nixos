{ ... }:
{ environment.etc =
    { "dd-agent/conf.d/nginx.yaml" =
        { source = ./nginx.yaml;
        };
    };
    
  networking.firewall.allowedTCPPorts = [ 80 ];

  services.dd-agent.tags =
    [ "nginx"
    ];

  services.nginx =
    { enable = true;
      statusPage = true;
    };
}
