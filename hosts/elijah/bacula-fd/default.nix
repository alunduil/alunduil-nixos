{ ... }:
{ imports =
    [ ../../../services/bacula-fd.nix
    ];

  environment.etc =
    { "bacula/bconsole.conf" =
        { mode = "0660";
          source = ./bconsole.conf;
        };
    };

  services.bacula-fd.name = "elijah.laptops.alunduil.com-fd";
}
