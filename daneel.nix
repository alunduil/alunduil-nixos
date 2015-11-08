{ config, pkgs, ... }:

{
  imports = [
    ./common-configuration.nix
  ];

  networking.hostName = "daneel.alunduil.com";

  services.postfix.enable = true;

  time.timeZone = "America/Chicago";
}
