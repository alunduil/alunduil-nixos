{ config, pkgs, ... }:

{
  imports = [
    ../system.nix
    ../services/backups/bacula-dir.nix
    ../services/backups/bacula-sd.nix
    ../services/backups/laptops.nix
  ];

  boot.loader.grub.devices = [
    "/dev/disk/by-id/ata-WDC_WD800JD-75MSA3_WD-WMAM9DLZ6740"
    "/dev/disk/by-id/ata-WDC_WD800JD-75MSA3_WD-WMAM9DLS6552"
  ];

  hardware.cpu.amd.updateMicrocode = true;

  time.timeZone = "America/Chicago";

  networking.hostName = "mycroft.alunduil.com";

  networking.nameservers = [
    "8.8.8.8"
    "8.8.4.4"
  ];

  networking.defaultGateway = "64.68.174.1";

  networking.interfaces.enp0s7.ip4 = [ { address = "64.68.174.54"; prefixLength = 24; } ];

  networking.localCommands = "ip route add 64.68.174.56 via 64.68.174.1";  # Thanks NVC
}
