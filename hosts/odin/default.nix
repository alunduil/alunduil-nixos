{ config, pkgs, ... }:
{
  imports = [
    ../../profiles/laptop
  ];

  networking = {
    hostId = "defdc9af";
    hostName = "odin";
  };

  i18n.consoleFont = "latarcyrheb-sun32";

  services = {
    postfix.hostname = pkgs.lib.mkForce "odin.laptops.alunduil.com";
    xserver = {
      dpi = 192;
      videoDrivers = [
        "amdgpu"
        "intel"
      ];
    };
  };

  time.timeZone = "America/Los_Angeles";
}
