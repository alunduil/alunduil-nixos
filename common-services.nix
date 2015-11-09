{ config, pkgs, ... }:

{
  imports = [
    ./bacula-fd.nix
  ];

  services.acpid.enable = true;

  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";
  services.openssh.startWhenNeeded = true;

  services.smartd.enable = true;
  services.smartd.notifications.mail.enable = true;

  services.smartd.devicse = [ { device = "/dev/sda"; } { device = "/dev/sdb"; } ];
  services.smartd.defaults.monitored = "-a -o on -s (S/../.././02|L/../../7/04)";

  services.uptimed.enable = true;
}
