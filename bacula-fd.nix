{ config, pkgs, ... }:

{
  imports = [];

  services.bacula-fd.enable = true;
}
