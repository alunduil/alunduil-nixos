{ config, pkgs, ... }:
{ imports =
    [ ./modules
      ./common.nix
    ];

  environment.systemPackages =
    [ pkgs.htop
      pkgs.iotop
      pkgs.lsof
      pkgs.ncdu
      pkgs.pavucontrol
      pkgs.pciutils
      pkgs.python27Packages.docker_compose
      pkgs.python27Packages.goobook
      pkgs.tmux  # See programs.tmux.enable
      pkgs.usbutils
      pkgs.wget
      pkgs.wgetpaste
    ];

  fonts = {
    enableDefaultFonts = true;
    enableFontDir = true;

    fonts = [ pkgs.hack-font ];
  };

  hardware = {
    bluetooth.enable = true;

    pulseaudio = {
      enable = true;
      package = pkgs.pulseaudioFull;
    };
  };

  networking = {
    hostName = "elijah";

    networkmanager.enable = true;
  };

  time.timeZone = "America/Chicago";
}
