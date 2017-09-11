{ config, pkgs, ... }:
{ environment.etc =
    { "dd-agent/conf.d/postfix.yaml" =
        { source = ./postfix.yaml;
        };
    };

  security.sudo.extraConfig =
    ''
    datadog ALL=(ALL) NOPASSWD:${pkgs.findutils.out}/bin/find
    '';

  services.dd-agent.tags =
    [ "postfix"
    ];

  services.postfix =
    { domain = "alunduil.com";
      enable = true;
      hostname = if config.networking.domain == null then config.networking.hostName else config.networking.hostName + "." + config.networking.domain;
      origin = "$mydomain";
      relayHost = "mail.alunduil.com";
      rootAlias = "alunduil";
    };
}
