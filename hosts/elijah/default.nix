{ config, pkgs, ... }:
{ imports =
    [ ./bacula-fd
      ./btrfs
      ./cifs
      ./chromecast.nix
      ./docker.nix
      ./postfix
      ./printing.nix
      ./redshift.nix
      ./slock.nix
      ../../system.nix
      ./udiskie.nix
      ./unclutter.nix
      ./urxvtd.nix
      ./upower.nix
      ./virtualbox.nix
      ./xserver.nix
    ];

  environment.systemPackages =
    [ pkgs.pavucontrol
      pkgs.python27Packages.docker_compose
      pkgs.python27Packages.goobook
      pkgs.tmux  # TODO programs.tmux.enable
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