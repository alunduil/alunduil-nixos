{ config, pkgs, ... }:

{
  imports = [];

  services.bacula-fd.enable = true;
  services.bacula-fd.director.name = config.networking.hostname + "-fd";

  services.bacula-fd.director."dornick.alunduil.com".password = "NrXXn/7ywN+DNmRxyL40+DVAe8x0oXRxz/ulsHL347Fc";
}
