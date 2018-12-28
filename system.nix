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
      pkgs.atop
      pkgs.bind
      pkgs.git
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
    gc = {
      automatic = true;
      options = "--delete-older-than 180d";
    };
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
}
