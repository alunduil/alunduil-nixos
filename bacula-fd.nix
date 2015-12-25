{ config, pkgs, ... }:

{
  imports = [];

  services.bacula-fd.enable = true;
  services.bacula-fd.name = config.networking.hostName + "-fd";

  services.bacula-fd.director."dornick.alunduil.com-dir".password = "NrXXn/7ywN+DNmRxyL40+DVAe8x0oXRxz/ulsHL347Fc";
  services.bacula-fd.director."mycroft.alunduil.com-dir".password = "998da8a46eaa434e8be8ff7fc877cf94";
}
