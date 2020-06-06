{ config, pkgs, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/profiles/hardened.nix>
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
      pkgs.lm_sensors
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

  i18n.defaultLocale = "en_GB.UTF-8";

  nix = {
    autoOptimiseStore = true;
    buildCores = 0;
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
    allowUserNamespaces = true;
    apparmor.enable = true;
    auditd.enable = true;
    audit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  services = {
    acpid.enable = true;
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };
  };

  system.autoUpgrade.enable = true;
}
