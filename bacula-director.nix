{ config, pkgs, ... }:

{
  imports = [];

  services.bacula-dir.enable = true;
}
