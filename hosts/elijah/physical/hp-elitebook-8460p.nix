{ pkgs, ... }:
{
  boot = {
    loader = {
      efi.canTouchEfiVariables = false;
      systemd-boot.enable = true;
    };

    supportedFilesystems = [
      "zfs"
    ];
  };

  environment.systemPackages = [
    pkgs.pcsctools
  ];

  hardware.cpu.intel.updateMicrocode = true;

  services.pcscd.enable = true;
}
