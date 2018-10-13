{ config, pkgs, ... }:
{
  imports = [
    ./services/smartd.nix
    ./users/alunduil.nix
  ];

  boot.tmpOnTmpfs = true;

  environment = {
    pathsToLink = [
      "/share/zsh"
    ];

    systemPackages = [
      pkgs.bind
      pkgs.git
      pkgs.htop
      pkgs.iftop
      pkgs.iotop
      pkgs.iptraf-ng
      pkgs.jq
      pkgs.lsof
      pkgs.ncdu
      pkgs.nethogs
      pkgs.nmap
      pkgs.pciutils
      pkgs.speedtest-cli
      pkgs.tree
      pkgs.usbutils
      pkgs.wget
      pkgs.wgetpaste
      pkgs.whois
    ];

    variables = {
      NIXPKGS_ALLOW_UNFREE = "1";
    };
  };

  nix = {
    autoOptimiseStore = true;
    gc.automatic = true;
    optimise.automatic = true;
    useSandbox = true;
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    vim.defaultEditor = true;

    zsh.enable = true;
  };

  security = {
    apparmor.enable = true;
    audit.enable = true;
    #lockKernelModules = true;
    sudo.wheelNeedsPassword = false;
  };

  services = {
    acpid.enable = true;
    cron.enable = false;
    fcron.enable = true;
  };

  system.autoUpgrade.enable = true;

  systemd = {
    services."nix-delete-older-than" = {
      description = "NixOS Delete Old Generations";
      documentation = [
        "man:nix-collect-garbage(1)"
      ];
      enable = true;
      script = "${pkgs.nix}/bin/nix-collect-garbage --delete-older-than 180d";
    };

    timers."nix-delete-older-than" = {
      description = "NixOS Daily Delete Old Generations";
      documentation = [
        "man:nix-collect-garbage(1)"
      ];
      enable = true;
      timerConfig = {
        OnCalendar = "daily";
      };
      wantedBy = [
        "timers.target"
      ];
    };
  };
}
