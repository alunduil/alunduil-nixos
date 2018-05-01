{ config, pkgs, ... }:
{ imports =
    [ ./bacula-fd
      ./btrfs
      ./chromecast.nix
      ./cifs
      ./docker.nix
      ./libvirtd.nix
      ./postfix
      ./redshift.nix
      ./slock.nix
      ../../system.nix
      ./udiskie.nix
      ./unclutter.nix
      ./upower.nix
      ./urxvtd.nix
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
    domain = "laptops.alunduil.com";
    hostName = "elijah";

    networkmanager.enable = true;
  };

  time.timeZone = "America/Los_Angeles";
}
