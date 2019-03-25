{ lib, pkgs, config, ... }:

with lib;

let
  cfg = config.services.zfs.autoReplication;
  stringcase = (pkgs.callPackage ../pkgs/stringcase.nix {
    inherit (pkgs.python36Packages) buildPythonPackage fetchPypi;
  });
  zfs-replicate = (pkgs.callPackage ../pkgs/zfs-replicate.nix {
    inherit (pkgs.python36Packages) buildPythonApplication click fetchPypi hypothesis pytest pytestcov pytestrunner;
    inherit stringcase;
  });
  replication = (
    { name, config, ... }:
    {
      options = {
        enable = mkEnableOption "ZFS snapshot replication for ${name}.";

        followDelete = mkOption {
          description = "Follow snapshot deletions and apply them to the remote pool.";
          default = cfg.followDelete;
          type = types.bool;
        };

        host = {
          description = "Remote host where snapshots should be sent.";
          default = cfg.host;
          example = "example.com";
          type = types.str;
        };

        identityFilePath = {
          description = "Path to SSH key used to login to host.";
          default = cfg.identityFilePath;
          example = "/home/username/.ssh/id_rsa";
          type = type.path;
        };

        localFilesystem = {
          description = "Local ZFS fileystem from which snapshots should be sent.";
          default = name;
          example = "pool/file/path";
          type = types.str;
        };

        remoteFilesystem = {
          description = "Remote ZFS filesystem where snapshots should be sent.";
          example = "pool/file/path";
          type = types.str;
        };

        resursive = mkOption {
          description = "Recursively send snapshots from source.";
          default = true;
          type = types.bool;
        };

        username = mkOption {
          description = "Remote username used by SSH to login to remote host.";
          default = cfg.username;
          example = "username";
          type = types.str;
        };
      }

      config = lib.mkIf cfg.enable {
        systemd.services."zfs-replication-${name}" = {
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
          path = [
            pkgs.lz4
          ];
          restartIfChanged = false;
          script = "${zfs-replicate}/bin/zfs-replicate --recursive -l ${escapeShellArg cfg.username} -i ${escapeShellArg cfg.identityPath} --follow-delete ${escapeShellArg cfg.hostname} ${cfg.destination} ${cfg.source}";
          wantedBy = [
            "zfs-snapshot-daily.service"
            "zfs-snapshot-frequent.service"
            "zfs-snapshot-hourly.service"
            "zfs-snapshot-monthly.service"
            "zfs-snapshot-weekly.service"
          ];
        };
      };


in {
  options.services.zfs.autoReplication = mkOption {
    description = "Definition of ZFS filesystems to replicate.";
    default = {};
    type = types.attrsOf (types.submodule replication);
  };

}
