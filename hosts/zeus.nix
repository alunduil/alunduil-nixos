{ ... }:
{ imports =
    [ ../profiles/cronus
      ../system.nix
    ];

  environment.noXlibs = true;

  networking =
    { hostName = "zeus";
    };

  sound.enable = false;

  time.timeZone = "America/Chicago";

  users.mutableUsers = false;
}