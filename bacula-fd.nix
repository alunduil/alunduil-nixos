{ config, pkgs, ... }:

{
  imports = [];

  networking.firewall.extraCommands = ''
  ip46tables -A nixos-fw -s 64.68.174.57 -p tcp --dport 9102 -j nixos-fw-accept
  '';

  boot.kernel.sysctl = {
    "net.ipv4.tcp_keepalive_time" = 30;
  };

  services.bacula-fd.enable = true;
  services.bacula-fd.name = config.networking.hostName + "-fd";

  services.bacula-fd.director."mycroft.alunduil.com-dir".password = "998da8a46eaa434e8be8ff7fc877cf94";

  services.bacula-fd.extraClientConfig = ''
  Heartbeat Interval = 30
  '';
}
