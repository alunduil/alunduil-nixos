{ config, pkgs, ... }:

{
  imports = [
    ../system.nix
    ../services/mail/dovecot.nix
  ];

  boot.loader.grub.devices = [
    "/dev/disk/by-id/ata-WDC_WD800JD-60LSA5_WD-WMAM9EV35606"
    "/dev/disk/by-id/ata-WDC_WD800JD-60LSA5_WD-WMAM9EV35973"
  ];

  hardware.cpu.amd.updateMicrocode = true;

  time.timeZone = "America/Chicago";

  networking.hostName = "sherlock.alunduil.com";

  networking.nameservers = [
    "8.8.8.8"
    "8.8.4.4"
  ];

  networking.defaultGateway = "64.68.174.1";

  networking.interfaces.enp0s7.ip4 = [ { address = "64.68.174.56"; prefixLength = 24; } ];

  networking.localCommands = ''
  ip route add 64.68.174.54 via 64.68.174.1;
  ip route add 64.68.174.55 via 64.68.174.1;
  '';  # Thanks NVC
}
