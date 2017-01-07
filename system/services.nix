{ config, pkgs, ... }:

{
  imports = [
    ./backups.nix
    ./mail.nix
    ./monitoring.nix
    ./services/cron.nix
    ./services/smart.nix
  ];

  services.acpid.enable = true;

  services.atd.enable = true;

  services.openssh.enable = true;
  services.openssh.startWhenNeeded = true;

  services.openssh.permitRootLogin = "no";
  services.openssh.challengeResponseAuthentication = false;
  services.openssh.passwordAuthentication = false;
}
