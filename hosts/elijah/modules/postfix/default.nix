{ ... }:
{ services.postfix =
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
