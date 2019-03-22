{ ... }:
{
  imports = [
    ./docker.nix
    ./etcd.nix
    ./kubernetes.nix
  ];
}
