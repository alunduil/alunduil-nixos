{ config, pkgs, ... }:

{
  imports = [
    ./system/networking.nix
    ./system/packages.nix
    ./system/security.nix
    ./system/services.nix
    ./system/updating.nix
    ./system/users.nix
  ];

  boot.loader.grub = {
    enable = true;
    version = 2;
  };

  boot.tmpOnTmpfs = true;

  environment.noXlibs = true;

  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" ];
}
