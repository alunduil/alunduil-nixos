{ config, pkgs, ... }:

{
  imports = [];

  services.smartd.enable = true;
  services.smartd.notifications.mail.enable = true;
  services.smartd.defaults.autodetected = "-a -o on -s (S/../.././02|L/../../7/04)";
}
