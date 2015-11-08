{ config, pkgs, ... }:

{
  imports = [
    ./common-configuration.nix
    ./simple-mail.nix
  ];

  networking.hostName = "daneel.alunduil.com";
  time.timeZone = "America/Chicago";
}
