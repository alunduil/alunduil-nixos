{ config, pkgs, ... }:

{
  imports = [];

  services.bacula-fd.enable = true;
  services.bacula-fd.name = config.networking.hostName + "-fd";

  services.bacula-fd.director."dornick.alunduil.com".password = "NrXXn/7ywN+DNmRxyL40+DVAe8x0oXRxz/ulsHL347Fc";
}
