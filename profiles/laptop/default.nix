{ config, pkgs, ... }:
{
  imports = [
    ../../services/postfix
    ../../system.nix
    ./cifs
    ./keybase.nix
    ./libvirtd.nix
    ./minikube.nix
    ./printing.nix
    ./tmux.nix
    ./upower.nix
    ./xserver.nix
    ./zfs.nix
  ];

  environment.systemPackages = [
    pkgs.google-chrome
    pkgs.gource
    pkgs.keybase
    pkgs.vscode-fhs
  ];

  fonts = {
    enableDefaultFonts = true;
    fontDir.enable = true;
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
