{ config, pkgs, ... }:

{
  imports = [];

  services.bacula-sd.enable = true;
}
