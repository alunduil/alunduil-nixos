{ ... }:
{ imports =
    [ ./etcd.nix
      ./kubernetes.nix
      ../../profiles/kubernetes
      ../../system.nix
    ];

  environment.noXlibs = true;

  networking =
    { hostName = "demeter";
    };

  sound.enable = false;

  time.timeZone = "America/Chicago";

  users.mutableUsers = false;
}
