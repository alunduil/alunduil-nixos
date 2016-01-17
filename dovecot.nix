{ config, pkgs, ... }:

{
  imports = [];

  servicse.dovecot2.enable = true;
  services.dovecot2.enableImap = true;
}
