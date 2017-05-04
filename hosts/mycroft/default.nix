{ ... }:
{ imports =
    [ ./bacula-dir
      ./bacula-sd.nix
      ../../services/bacula-fd.nix
      ../../system.nix
    ];

  environment.noXlibs = true;

  networking =
    { domain = "alunduil.com";
      hostName = "mycroft";
    };

  sound.enable = false;

  time.timeZone = "America/Chicago";

  users.mutableUsers = false;
}
