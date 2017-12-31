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
    { appendHttpConfig = ''
      upstream fates {
        server atropos:443;
        server clothio:443;
        server lachesis:443;
      }

      server {
        listen 80;

        location / {
          proxy_pass https://fates;
        }
      }
      ''
      enable = true;
      statusPage = true;
    };
}
