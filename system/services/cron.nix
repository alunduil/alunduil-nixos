{ config, pkgs, ... }:

{
  imports = [];

  services.cron.enable = false;
  services.fcron.enable = true;
}
