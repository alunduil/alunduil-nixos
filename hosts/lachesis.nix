{ ... }:
{ imports =
    [ ../profiles/fates
      ../system.nix
    ];

  environment.noXlibs = true;

  networking =
    { hostName = "lachesis";
    };

  sound.enable = false;

  time.timeZone = "America/Chicago";

  users.mutableUsers = false;
}
