{ config, pkgs, ... }:

{
  imports = [];

  services.dd-agent.tags = [ "bacula-fd" ];

  networking.firewall.extraCommands = ''
  iptables -A nixos-fw -s 64.68.174.54 -p tcp --dport 9102 -j nixos-fw-accept
  '';

  services.cron.systemCronJobs = [
    "29 5 1 * * for D in /dev/?d?; do sfdisk -d $D; done 2>/dev/null | sed -e 's/label: gpt/\n&/g' > /partitions.txt"
  ];

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
