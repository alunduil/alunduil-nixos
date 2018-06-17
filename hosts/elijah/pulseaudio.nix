{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.pavucontrol
  ];
  
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;
  };
}
