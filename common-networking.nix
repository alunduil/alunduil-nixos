{ config, pkgs, ... }:

{
  imports = [];

  boot.kernelParams = [ "ipv6.disable=1" ];
  networking.enableIPv6 = false;

  networking.dnsSingleRequest = true;

  networking.domain = "alunduil.com";

  networking.firewall.allowPing = true;
}
