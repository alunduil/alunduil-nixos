{ pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot = {
        consoleMode = "auto";
        enable = true;
      };
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
