{ ... }:
{
  services = {
    bacula-sd = {
      device = {
        "USB-RAID" = {
          archiveDevice = "/var/backups";
          extraDeviceConfig =
            ''
            Device Type = File
            Random Access = yes
            Requires Mount = no
            Label Media = yes
            '';
          mediaType = "USB-RAID-882e244d128a40ffaa0c85b4f58457f2";
        };
      };

      director = {
        "mycroft.alunduil.com-dir" = {
          password = "ab21917b042b43ae996534179bb32eba";
        };
      };

      enable = true;

      extraStorageConfig =
        ''
        Heartbeat Interval = 30
        '';

      name = "mycroft.alunduil.com-sd";
    };

    dd-agent.tags = [
      "bacula-sd"
    ];
  };
}
