{ lib, pkgs, config, ... }:
with lib;
let
  cfg = config.services.zfs.autoReplication;
in {
  options.services.zfs.autoReplication = {
    enable = mkEnableOption "ZFS Snapshot Replication";

    username = mkOption {
      type = types.str;
      description = ''
        Remote username used by SSH to login to destination.
        '';
    };
    identityPath = "";
    resursive = true;
    followDelete = true;
    hostname = "";
    destinationPool = [""];
  }

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.lz4
    ];

    systemd.services."zfs-replication" = {
    after = [
      "zfs-snapshot-daily.service"
      "zfs-snapshot-frequent.service"
      "zfs-snapshot-hourly.service"
      "zfs-snapshot-monthly.service"
      "zfs-snapshot-weekly.service"
    ];
    description = "ZFS Snapshot Replication";
    documentation = [
      "https://github.com/alunduil/zfs-replicate"
    ];
    enable = true;
    restartIfChanged = false;
    script = "${pkgs.zfs-replicate}/bin/zfs-replicate --recursive -l ${escapeShellArg cfg.username} -i ${escapeShellArg cfg.identityPath} --follow-delete ${escapeShellArg cfg.hostname} volume-11f20cf1-b1b1-4d83-a356-56212ce80221/backups/alunduil/laptop ${config.networking.hostName}-boot/ROOT";
    wantedBy = [
      "zfs-snapshot-daily.service"
      "zfs-snapshot-frequent.service"
      "zfs-snapshot-hourly.service"
      "zfs-snapshot-monthly.service"
      "zfs-snapshot-weekly.service"
    ];
  };

