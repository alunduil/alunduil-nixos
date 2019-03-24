{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.pcsctools
  ];

  services.pcscd.enable = true;
}
