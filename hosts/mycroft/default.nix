{ ... }:
{ imports =
    [ ./bacula-dir
      ./bacula-sd.nix
      ../../services/bacula-fd.nix
      ../../system.nix
    ];

  networking =
    { domain = "alunduil.com";
      hostName = "mycroft";
    };

  time.timeZone = "America/Chicago";

  users.mutableUsers = false;
}
