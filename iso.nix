{ config, pkgs, ... }:
{
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>

    "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/master.tar.gz}/nixos"

    ./profiles/laptop
    ./system.nix
  ];

  boot.supportedFilesystems = [
    "zfs"
  ];

  home-manager.users.alunduil = builtins.readFile (
    pkgs.fetchFromGitHub
      {
        owner = "alunduil";
        repo = "alunduil-home";
        rev = "c1d18b9fabc00770ede18e9d78f68ef866adcf1f";
        sha256 = "0ls33690pah3v0666p4yf7ikdiqdswrr0n1ldrbmzy1znkvak28y";
      } + "/home.nix"
  );

  networking = {
    networkmanager.enable = true;
    wireless.enable = false;
  };
}
