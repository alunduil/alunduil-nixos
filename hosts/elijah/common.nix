{ pkgs, ... }:
{ boot.tmpOnTmpfs = true;
  environment.variables =
    { NIXPKGS_ALLOW_UNFREE = "1";
    };

  nix = {
    autoOptimiseStore = true;
    gc.automatic = true;
    optimise.automatic = true;
    useSandbox = true;
  };

  nixpkgs.config.allowUnfree = true;

  programs =
    { vim.defaultEditor = true;

      zsh.enable = true;
    };

/*
  security.apparmor.enable = true;
  security.audit.enable = true;
  security.grsecurity.enable = true;
*/
  security.sudo.wheelNeedsPassword = false;

  services =
    { acpid.enable = true;

      cron.enable = false;
      fcron.enable = true;
    };

  services.cron.systemCronJobs =
    [ "%nightly,random * * nix-env --delete-generations 364d"
    ];

  services.smartd =
    { defaults.autodetected = "-a -o on -s (S/../.././02|L/../../7/04)";
      enable = true;
      notifications.mail.enable = true;
    };

  system.autoUpgrade.enable = true;

  users.users =
    { alunduil =
        { description = "Alex Brandt,,,210.723.0367,alunduil@alunduil.com";
          extraGroups =
            [ "docker"
              "networkmanager"
              "wheel"
            ];
          isNormalUser = true;
          shell = pkgs.zsh;
        };
    };

}
