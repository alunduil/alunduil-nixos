{ config, pkgs, ... }:

{
  imports = [];

  services.bacula-fd.enable = true;
  services.bacula-fd.name = config.networking.hostName + "-fd";

  services.bacula-fd.director."mycroft.alunduil.com-dir".password = "998da8a46eaa434e8be8ff7fc877cf94";

  networking.firewall.extraCommands = ''
  iptables -A nixos-fw -s mycroft.alunduil.com -p tcp --dport 9102 -j nixos-fw-accept
  ''
}
