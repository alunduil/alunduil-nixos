{ pkgs, ... }:
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

/* TODO
  security.apparmor.enable = true;
  security.audit.enable = true;
  security.grsecurity.enable = true;
*/

  security.sudo.wheelNeedsPassword = false;

  services = {
    acpid.enable = true;

    cron = {
      enable = false;
      systemCronJobs = [
        "%nightly,random,mailto(alunduil+${config.networking.hostName}@gmail.com) * * nix-collect-garbage --delete-older-than 180d"
      ];
    };

    fcron.enable = true;
  };

  system.autoUpgrade.enable = true;
}
