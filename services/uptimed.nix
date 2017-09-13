{ pkgs, ... }:
{ environment.systemPackages =
    [ pkgs.uptimed
    ];

  services.uptimed.enable = true;
}
