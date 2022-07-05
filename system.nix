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
      pkgs.gitAndTools.gitFull
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

  location.provider = "geoclue2";

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
    audit = {
      backlogLimit = 8192;
      enable = true;
      rules = [
        "-a exit,never -F arch=b32 -S read -S write -S open -S fstat -S mmap -S brk -S munmap -S nanosleep -S fcntl -S close -S dup2 -S rt_sigaction -S stat"
        "-a exit,never -F arch=b64 -S read -S write -S open -S fstat -S mmap -S brk -S munmap -S nanosleep -S fcntl -S close -S dup2 -S rt_sigaction -S stat"
      ];
    };
    auditd.enable = true;
    lockKernelModules = false;
    sudo.wheelNeedsPassword = false;
  };

  services = {
    acpid.enable = true;
    clamav = {
      daemon.enable = true;
      updater.enable = true;
    };
    geoclue2.appConfig."localtimed" = { users = [ "997" ]; isSystem = true; isAllowed = true; };
    localtime.enable = true;
    sysstat.enable = true;
  };

  system.autoUpgrade.enable = true;
}
