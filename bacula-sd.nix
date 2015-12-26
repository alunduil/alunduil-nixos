{ config, pkgs, ... }:

{
  imports = [];

  services.bacula-sd.enable = true;
  services.bacula-sd.name = config.networking.hostName + "-sd";

  services.bacula-sd.director."mycroft.alunduil.com-dir".password = "ab21917b042b43ae996534179bb32eba";
}
