{ config, pkgs, ... }:

{
  imports = [
    ./bacula-fd.nix
  ];

  services.acpid.enable = true;

  services.atd.enable = true;

  services.locate.enable = true;

  services.openssh.enable = true;
  services.openssh.startWhenNeeded = true;

  services.openssh.permitRootLogin = "no";
  services.openssh.challengeResponseAuthentication = false;
  services.openssh.passwordAuthentication = false;

  services.smartd.enable = true;
  services.smartd.notifications.mail.enable = true;
  services.smartd.defaults.autodetected = "-a -o on -s (S/../.././02|L/../../7/04)";

  services.uptimed.enable = true;
}
