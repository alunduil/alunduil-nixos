{ ... }:
{ imports =
    [ ../../system.nix
    ];

  environment.noXlibs = true;

  networking =
    { hostName = "hera";
    };

  sound.enable = false;

  time.timeZone = "America/Chicago";

  users.mutableUsers = false;
}
