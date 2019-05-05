{ config, pkgs, ... }:
{
  imports = [
    ./chromecast.nix
    ./cifs
    ./libvirtd.nix
    ./minikube.nix
    ./pulseaudio.nix
    ./redshift.nix
    ../../services/postfix
    ./slock.nix
    ../../system.nix
    ./tmux.nix
    ./udiskie.nix
    ./unclutter.nix
    ./upower.nix
    ./xserver.nix
    ./zfs.nix
  ];

  environment.systemPackages = [
    pkgs.alacritty
    pkgs.google-chrome
    pkgs.gource
    pkgs.python36Packages.goobook
  ];

  fonts = {
    enableDefaultFonts = true;
    enableFontDir = true;
    fonts = [
      pkgs.noto-fonts
      pkgs.noto-fonts-cjk
      pkgs.noto-fonts-emoji
      pkgs.noto-fonts-extra
    ];
  };

  hardware.bluetooth.enable = true;

  networking = {
    domain = "laptops.alunduil.com";

    networkmanager.enable = true;
  };

  powerManagement.powertop.enable = true;
}
