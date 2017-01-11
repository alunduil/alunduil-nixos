{ config, pkgs, ... }:

{
  imports = [];

  nix.gc.automatic = true;
  nix.useSandbox = true;

  system.autoUpgrade.enable = true;

  services.cron.systemCronJobs = [
    "%nightly,random * * nix-env --delete-generations 364d"
    "%weekly,random  * * nix-store --optimise"
  ];
}
