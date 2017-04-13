{ pkgs, ... }:
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
      extraConfig = builtins.readFile ./main.cf;
      hostname = "elijah.laptops.alunduil.com";
      mapFiles =
        { "sasl_passwords" = ./sasl_passwords;
        };
      origin = "$mydomain";
      relayHost = "mail.alunduil.com";
      rootAlias = "alunduil";
    };
}
