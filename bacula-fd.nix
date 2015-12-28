{ config, pkgs, ... }:

{
  imports = [];

  services.bacula-fd.enable = true;
  services.bacula-fd.name = config.networking.hostName + "-fd";

  services.bacula-fd.director."mycroft.alunduil.com-dir".password = "998da8a46eaa434e8be8ff7fc877cf94";

  networking.firewall.extraCommands = ''
  ip46tables -A nixos-fw -s 64.68.174.57 -p tcp --dport 9102 -j nixos-fw-accept
  '';
}
