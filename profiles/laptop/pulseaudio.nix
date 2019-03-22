{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.pavucontrol
  ];

  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
    support32Bit = true;
  };

  nixpkgs.config.pulseaudio = true;
}
