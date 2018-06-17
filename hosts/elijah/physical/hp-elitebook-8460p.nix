{ pkgs, ... }:
{
  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = false;
  };

  environment.systemPackages = [
    pkgs.pcsc-tools
  ];

  hardware.cpu.intel.updateMicrocode = true;

  services = {
    dd-agent.tags = [
      "hp"
      "laptop"
    ];

    pcscd.enable = true;
  };
}
