{ ... }:
{ imports =
    [ ../../profiles/cronus
      ../../system.nix
    ];

  environment.noXlibs = true;

  networking =
    { hostName = "poseidon";
    };

  sound.enable = false;

  time.timeZone = "America/Chicago";

  users.mutableUsers = false;
}
