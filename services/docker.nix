{ ... }:
{
  boot.kernelModules = [ "veth" ];

  virtualisation.docker = {
    autoPrune.enable = true;
    enable = true;
  };
}
