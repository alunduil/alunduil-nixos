{ config, pkgs, ... }:

{
  imports = [];

  networking.firewall.allowedTCPPorts = [ 143 ];

  services.dovecot2.enable = true;
  services.dovecot2.enableImap = true;
  services.dovecot2.enablePop3 = false;

  services.dovecot2.extraConfig = ''
  listen = *
  '';
}
