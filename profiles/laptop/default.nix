{ config, pkgs, ... }:
{
  imports = [
    ./chromecast.nix
    ./cifs
    ./libvirtd.nix
    ../../services/postfix
    ./pulseaudio.nix
    ./redshift.nix
    ../../services/docker.nix
    ./slock.nix
    ../../system.nix
    ./tmux.nix
    ./udiskie.nix
    ./unclutter.nix
    ./upower.nix
    ./urxvtd.nix
    ./xserver.nix
    ./zfs.nix
  ];

  environment.systemPackages = [
    pkgs.alacritty
    pkgs.google-chrome
    pkgs.gource
    pkgs.kubectl
    pkgs.minikube
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
