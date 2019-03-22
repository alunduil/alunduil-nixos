{ pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot = {
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
  i18n.consoleFont = "latercyrheb-sun32";

  nix.maxJobs = 8;

  services = {
    pcscd.enable = true;
    smartd.devices = [
      {
        device = "/dev/nvme0n1";
        options = "-d nvme,0xffffffff";
      }
    ];
    xserver = {
      dpi = 192;
      videoDrivers = [
        "amdgpu"
        "intel"
      ];
    };
  };
}
