{ config, pkgs, ... }:
{
  imports = [
    ./bacula-fd
    ./chromecast.nix
    ./cifs
    ./docker.nix
    ./libvirtd.nix
    ./postfix.nix
    ./pulseaudio.nix
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

  environment.systemPackages = [
    pkgs.chromium
    pkgs.dwarf-fortress
    pkgs.glxinfo
    pkgs.gource
    pkgs.picard
    pkgs.python36Packages.docker_compose
    pkgs.python27Packages.goobook
    pkgs.rogue
  ];

  fonts = {
    enableDefaultFonts = true;
    enableFontDir = true;

    fonts = [ pkgs.hack-font ];
  };

  hardware.bluetooth.enable = true;

  networking = {
    domain = "laptops.alunduil.com";
    hostName = "elijah";

    networkmanager.enable = true;
  };

  powerManagement.powertop.enable = true;

  time.timeZone = "America/Los_Angeles";
}
