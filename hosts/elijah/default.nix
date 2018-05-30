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
      ./tmux.nix
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

  powerManagement.powertop.enable = true;

  time.timeZone = "America/Los_Angeles";
}
