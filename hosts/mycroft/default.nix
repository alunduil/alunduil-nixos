{ pkgs, ... }:
{
  imports = [
    ./bacula-dir
    ./bacula-sd.nix
    ../../services/bacula-fd.nix
    ../../services/openssh.nix
    ../../services/postfix
    ../../services/smartd.nix
    #../../system.nix
    ../../users/alunduil.nix
  ];

  boot.tmpOnTmpfs = true;

  environment = {
    systemPackages = [
      pkgs.git
      pkgs.htop
      pkgs.iftop
      pkgs.iotop
      pkgs.iptraf-ng
      pkgs.lsof
      pkgs.ncdu
      pkgs.nethogs
      pkgs.pciutils
      pkgs.usbutils
      pkgs.vim
      pkgs.wget
      pkgs.wgetpaste
    ];

    variables = {
      EDITOR = "vim";
      NIXPKGS_ALLOW_UNFREE = "1";
    };

    noXlibs = true;
  };

  nix = {
    gc.automatic = true;
    useChroot = true;
  };

  nixpkgs.config.allowUnfree = true;

  programs = {
    zsh.enable = true;
  };

  security.sudo.wheelNeedsPassword = false;

  services = {
    acpid.enable = true;

    cron = {
      enable = false;
      systemCronJobs = [
        "%nightly,random * * nix-collect-garbage --delete-older-than 180d"
        "%nightly,random * * nix-store --optimise"
      ];
    };

    fcron.enable = true;
  };

  system.autoUpgrade.enable = true;

  networking = {
    domain = "alunduil.com";
    hostName = "mycroft";
  };

  sound.enable = false;

  time.timeZone = "America/Chicago";

  users = {
    mutableUsers = false;
    users.alunduil.shell = pkgs.lib.mkForce "/run/current-system/sw/bin/zsh";
  };
}
