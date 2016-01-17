{ config, pkgs, ... }:

{
  imports = [];

  services.dovecot2.enable = true;
  services.dovecot2.enableImap = true;
}
