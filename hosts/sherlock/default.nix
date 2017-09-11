{ ... }:
{ imports =
    [ ../../services/bacula-fd.nix
      ../../services/openssh.nix
      ../../services/postfix.nix
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
