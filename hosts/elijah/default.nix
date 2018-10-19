{ config, pkgs, ... }:
{
  imports = [
    ./chromecast.nix
    ./cifs
    ./libvirtd.nix
    ./postfix.nix
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
    ./zfs
  ];

  environment.systemPackages = [
    pkgs.chromium
    pkgs.glxinfo
    pkgs.gource
    pkgs.python36Packages.docker_compose
    pkgs.python27Packages.goobook
  ];

  fonts = {
    enableDefaultFonts = true;
    enableFontDir = true;
  };

  hardware.bluetooth.enable = true;

  networking = {
    domain = "laptops.alunduil.com";
    hostId = "defdc9af";
    hostName = "elijah";

    networkmanager.enable = true;
  };

  powerManagement.powertop.enable = true;

  time.timeZone = "America/Los_Angeles";
}
