{ config, pkgs, ... }:

{
  imports = [];

  services.postfix.enable = true;
  services.postfix.relayHost = "[mail.alunduil.com]";
  services.postfix.extraAliases = [
    "root: alunduil"
  ];
}
