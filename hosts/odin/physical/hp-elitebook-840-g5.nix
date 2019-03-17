{ pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot = {
        consoleMode = "auto";
        editor = false;
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

  nix.maxJobs = 8;

  services = {
    pcscd.enable = true;
    smartd.devices = [
      {
        device = "/dev/nvme0n1";
        options = "-d nvme,0xffffffff";
      }
    ];
  };
}
