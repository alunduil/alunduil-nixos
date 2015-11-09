{ config, pkgs, ... }:

{
  imports = [];

  services.acpid.enable = true;

  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";
  services.openssh.startWhenNeeded = true;

  services.uptimed.enable = true;
}
