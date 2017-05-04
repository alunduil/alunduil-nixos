{ ... }:
{ imports =
    [ ../../system.nix
      ../../users/perniferuse.nix 
    ];

  networking =
    { domain = "alunduil.com";
      hostName = "sherlock";
    };

  time.timeZone = "America/Chicago";

  users.mutableUsers = false;
}
