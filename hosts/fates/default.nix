{ ... }:
{ imports =
    [ ./nginx
      ../../system.nix
    ];

  environment.noXlibs = true;

  networking =
    { hostName = "fates";
    };

  sound.enable = false;

  time.timeZone = "America/Chicago";

  users.mutableUsers = false;
}
