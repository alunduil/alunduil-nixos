{ pkgs, ... }:
{
  imports = [
    ../../services/docker.nix
  ];

  environment.systemPackages = [
    pkgs.docker-machine
    pkgs.docker-machine-kvm
    pkgs.docker-machine-kvm2
    pkgs.kubectl
    pkgs.kubernetes-helm
    pkgs.minikube
  ];
}
