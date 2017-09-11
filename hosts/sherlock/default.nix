{ ... }:
{ imports =
    [ ../../services/openssh.nix
      ../../system.nix
      ../../users/perniferuse.nix 
    ];

  environment.noXlibs = true;

  networking =
    { domain = "alunduil.com";
      hostName = "sherlock";
    };

  sound.enable = false;

  time.timeZone = "America/Chicago";

  users.mutableUsers = false;
}
