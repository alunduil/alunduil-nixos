{ config, pkgs, ... }:
{
  imports = [
    "../../../modules/zfs-replication.nix"
  ];

  boot.supportedFilesystems = [
    "zfs"
  ];

  services.zfs = {
    autoReplication."${config.networking.hostName}-boot/ROOT" = {
      destination = "volume-11f20cf1-b1b1-4d83-a356-56212ce80221/backups/alunduil/laptop";
      enable = true;
      hostname = "groton.alunduil.com";
      identityPath = "/home/alunduil/.ssh/id_rsa";
      username = "alunduil";
    };
    autoScrub.enable = true;
    autoSnapshot = {
      daily = 14;
      enable = true;
      frequent = 8;
      hourly = 48;
      monthly = 24;
      weekly = 8;
    };
  };
}
