{ config, pkgs, ... }:
{
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
    path = [
      (pkgs.callPackage ./zfs-replicate.nix {
        inherit (pkgs.python36Packages) buildPythonApplication click fetchPypi hypothesis pytest pytestcov pytestrunner;
        stringcase = (pkgs.callPackage ./stringcase.nix {
          inherit (pkgs.python36Packages) buildPythonPackage fetchPypi;
        });
      })
    ];
    script = "zfs-replicate --recursive -l alunduil -i /home/alunduil/.ssh/id_rsa --follow-delete groton.alunduil.com volume-11f20cf1-b1b1-4d83-a356-56212ce80221/backups/alunduil/laptop ${config.networking.hostName}-boot/ROOT";
    serviceConfig = {};
    unitConfig = {};
    wantedBy = [
      "zfs-snapshot-daily.service"
      "zfs-snapshot-frequent.service"
      "zfs-snapshot-hourly.service"
      "zfs-snapshot-monthly.service"
      "zfs-snapshot-weekly.service"
    ];
  };

  services.zfs = {
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
