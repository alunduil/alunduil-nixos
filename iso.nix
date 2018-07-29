{config, pkgs, ...}:
{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>

    ./system.nix
  ];

  boot.supportedFilesystems = [
    "zfs"
  ];

  networking = {
    networkmanager.enable = true;
    wireless.enable = false;
  };
}
