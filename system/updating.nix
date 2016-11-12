{ config, pkgs, ... }:

{
  imports = [];

  nix.gc.automatic = true;
  nix.useChroot = true;

  system.autoUpgrade.enable = true;

  services.cron.systemCronJobs = [
    "9 3 * * * nix-env --delete-generations 364d"
    "19 4 * * 6 nix-store --optimise"
  ];
  services.fcron.systab = ''
  @nightly,random * * nix-env --delete-generations 364d
  @weekly,random  * * nix-store --optimise
  '';
}
