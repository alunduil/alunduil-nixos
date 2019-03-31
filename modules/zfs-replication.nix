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
  recursive = if cfg.recursive then " --recursive" else "";
  followDelete = if cfg.followDelete then " --follow-delete" else "";
in {
  options.services.zfs.autoReplication = {
    enable = mkEnableOption "ZFS snapshot replication.";

    followDelete = mkOption {
      description = "Remove remote snapshots that don't have a local correspondant.";
      default = true;
      type = types.bool;
    };

    host = mkOption {
      description = "Remote host where snapshots should be sent.";
      example = "example.com";
      type = types.str;
    };

    identityFilePath = mkOption {
      description = "Path to SSH key used to login to host.";
      example = "/home/username/.ssh/id_rsa";
      type = types.path;
    };

    localFilesystem = mkOption {
      description = "Local ZFS fileystem from which snapshots should be sent.  Defaults to the attribute name.";
      example = "pool/file/path";
      type = types.str;
    };

    remoteFilesystem = mkOption {
      description = "Remote ZFS filesystem where snapshots should be sent.";
      example = "pool/file/path";
      type = types.str;
    };

    recursive = mkOption {
      description = "Recursively discover snapshots to send.";
      default = true;
      type = types.bool;
    };

    username = mkOption {
      description = "Username used by SSH to login to remote host.";
      example = "username";
      type = types.str;
    };
  };

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
      restartIfChanged = false;
      script = "${zfs-replicate}/bin/zfs-replicate${recursive} -l ${escapeShellArg cfg.username} -i ${escapeShellArg cfg.identityFilePath}${followDelete} ${escapeShellArg cfg.host} ${escapeShellArg cfg.remoteFilesystem} ${escapeShellArg cfg.localFilesystem}";
      wantedBy = [
        "zfs-snapshot-daily.service"
        "zfs-snapshot-frequent.service"
        "zfs-snapshot-hourly.service"
        "zfs-snapshot-monthly.service"
        "zfs-snapshot-weekly.service"
      ];
    };
  };

  meta = {
    maintainers = with lib.maintainers; [ alunduil ];
  };
}