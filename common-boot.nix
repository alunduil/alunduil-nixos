{ config, pkgs, ... }:

{
  imports = [];

  boot.enableContainers = false;

  boot.loader.grub = {
    enable = true;
    version = 2;
    devices = [
      "/dev/sda"
      "/dev/sdb"
    ];
  };

  boot.tmpOnTmpfs = true;
}
