{ pkgs, ... }:
{
  imports = [
    ../hardware/cpu/intel.nix
    ../hardware/smartcard.nix
  ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = false;
      systemd-boot.enable = true;
    };
  };
}
