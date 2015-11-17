{ config, pkgs, ... }:

{
  imports = [];

  boot.kernelParams = [ "ipv6.disable=1" ];
  networking.enableIPv6 = false;

  networking.dnsSingleRequest = true;

  networking.domain = "alunduil.com";

  networking.interfaceMonitor.enable = true;
  networking.interfaceMonitor.beep = true;

  networking.tcpcrypt.enable = true;

  networking.firewall.allowPing = true;
}
