{ pkgs, ... }:
{ environment.systemPackages =
    [ pkgs.hplip
    ];
    
  services.printing =
    { drivers = [ pkgs.hplip ];
      enable = true;
    };
}
