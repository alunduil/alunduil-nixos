{ ... }:
{
  environment.systemPackages = [
    pkgs.lz4
  ];

  /*
  services = {
    systemd = {
      services."zfs-replication" = {
        after = [];
        aliases = [];
        before = [];
        bindsTo = [];
        conflicts = [];
        description = "";
        documentation = [];
        enable = true;
        environment = {
          REMOTE_HOST = "groton.alunduil.com";
          REMOTE_PORT = "22";
          DEDICATED_USER = "alunduil";
          REMOTEFS = "volume-11f20cf1-b1b1-4d83-a356-56212ce80221/backups/alunduil/laptop";
          LOCALFS = "elijah-boot/ROOT";
          FOLLOW_DELETE = true;
          RECURSIVE = true;
        };
        onFailure = [];
        partOf = [];
        path = [];
        postStart = "";
        postStop = "";
        preStart = "";
        preStop = "";
        reload = "";
        reloadIfChanges = false;
        requiredBy = [];
        requires = [];
        requisite = [];
        restartIfChanged = false;
        restartTriggers = [];
        script = "${pkgs.ssh} -i ${ssh_key} -o BatchMode=yes -o StrictHostKeyChecking=yes -o ConnectTimeout=7";
        scriptArgs = "";
        serviceConfig = {};
        startAt = [];
        stopIfChanged = false;
        unitConfig = {};
        wantedBy = [];
        wants = [];
      };
    };
    */

    zfs = {
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
  };
}
