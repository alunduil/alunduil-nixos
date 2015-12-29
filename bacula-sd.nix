{ config, pkgs, ... }:

{
  imports = [];

  fileSystems."/var/backups" = {
    device = "/dev/disk/by-uuid/8ecf60d1-8450-46c7-b171-b7eb5c4b2ade";
    fsType = "ext4";
    neededForBoot = true;
  };

  services.bacula-sd.enable = true;
  services.bacula-sd.name = config.networking.hostName + "-sd";

  services.bacula-sd.director."mycroft.alunduil.com-dir".password = "ab21917b042b43ae996534179bb32eba";

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
