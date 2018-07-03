{ ... }:
{
  imports = [
    ../../services/docker.nix
  ];

  virtualisation.docker.storageDriver = "btrfs";
}
