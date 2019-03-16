{ pkgs, ... }:
let defaults = "-a -o on -s (S/../.././02|L/../../7/04) -T permissive";
in
  {
    environment.systemPackages = [
      pkgs.smartmontools
    ];

    services.smartd = {
      defaults.autodetected = defaults;
      defaults.monitored = defaults;
      devices = [
        {
          device = "/dev/nvme0n1";
          options = "-d nvme,0xffffffff";
        }
      ];
      enable = true;
      notifications.mail.enable = true;
    };
  }
