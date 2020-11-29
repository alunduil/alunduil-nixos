{ config, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.smartmontools
  ];

  services.smartd =
    let
      defaults = "-a -o on -s (S/../.././02|L/../../7/04) -T permissive";
    in
    {
      defaults.autodetected = defaults;
      defaults.monitored = defaults;
      enable = true;
      notifications.mail = {
        enable = true;
        recipient = "alunduil+${config.networking.hostName}@gmail.com";
      };
    };
}
