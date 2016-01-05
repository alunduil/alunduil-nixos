{ config, pkgs, ... }:

{
  imports = [];

  boot.kernel.sysctl = {
    net.ipv4.tcp_keepalive_time = 30;
  };

  services.bacula-sd.enable = true;
  services.bacula-sd.name = config.networking.hostName + "-sd";

  services.bacula-sd.director."mycroft.alunduil.com-dir".password = "ab21917b042b43ae996534179bb32eba";

  services.bacula-sd.extraStorageConfig = ''
  Heartbeat Interval = 30
  '';

  services.bacula-sd.device."USB-RAID1" = {
    archiveDevice = "/var/backups";
    mediaType = "USB-RAID1-882e244d128a40ffaa0c85b4f58457f2";
    extraDeviceConfig = ''
    Device Type = File
    Random Access = yes
    Requires Mount = no
    Label Media = yes
    '';
  };
}
