{ config, pkgs, ... }:

{
  imports = [];

  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";
  services.openssh.startWhenNeeded = true;

  services.uptimed.enable = true;
}
