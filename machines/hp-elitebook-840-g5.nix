{ pkgs, ... }:
{
  imports = [
    ../hardware/cpu/intel.nix
    ../hardware/nvme.nix
    ../hardware/smartcard.nix
  ];

  boot = {
    loader = {
      systemd-boot = {
        editor = false;
        enable = true;
      };
    };
  };

  console.font = "latercyrheb-sun32";

  services = {
    xserver = {
      dpi = 192;
      videoDrivers = [
        "amdgpu"
        "intel"
      ];
    };
  };
}
