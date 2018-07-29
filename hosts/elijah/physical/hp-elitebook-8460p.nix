{ pkgs, ... }:
{
  boot = {
    loader = {
      efi.canTouchEfiVariables = false;
      systemd-boot.enable = true;
    };

    supportedFilesystems = [
      "btrfs"
      "zfs"
    ];
  };

  environment.systemPackages = [
    pkgs.pcsctools
  ];

  hardware.cpu.intel.updateMicrocode = true;

  services.pcscd.enable = true;
}
