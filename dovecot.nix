{ config, pkgs, ... }:

{
  imports = [];

  services.dovecot2.enable = true;
  services.dovecot2.enableImap = true;
  services.dovecto2.enablePop3 = false;

  services.dovecot2.extraConfig = ''
  listen = *
  '';
}
