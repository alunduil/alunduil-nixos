{ config, pkgs, ... }:

{
  imports = [];

  services.bacula-sd.enable = true;
  services.bacula-sd.name = config.networking.hostName + "-sd";

  services.bacula-fd."mycroft.alunduil.com-dir".password = "998da8a46eaa434e8be8ff7fc877cf94";
}
