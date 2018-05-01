{ pkgs, ... }:
{ imports =
    [ ../../../services/postfix
    ];
    
  services.postfix =
    { extraConfig = builtins.readFile ./main.cf;
      hostname = pkgs.lib.mkForce "elijah.laptops.alunduil.com";
      relayHost = pkgs.lib.mkForce "mail.alunduil.com:587";
      mapFiles =
        { "sasl_passwords" = ./sasl_passwords;
        };
    };
}
