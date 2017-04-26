{ ... }:
{ imports =
    [ ../../system.nix
    ];

  environment.noXlibs = true;

  services.dd-agent.tags =
    [ "cronus"
    ];

  sound.enable = false;

  users.mutableUsers = false;
}
