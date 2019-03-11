{ ... }:
let defaults = "-a -o on -s (S/../.././02|L/../../7/04) -T permissive";
in
  {
    services.smartd = {
      defaults.autodetected = defaults;
      defaults.monitored = defaults;
      devices = [
        { device = "/dev/nvme0n1"; }
      ];
      enable = true;
      notifications.mail.enable = true;
    };
  }
