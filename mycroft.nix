{ config, pkgs, ... }:

{
  imports = [
    ./common-configuration.nix
    ./simple-mail.nix
  ];

  hardware.cpu.amd.updateMicrocode = true;

  time.timeZone = "America/Chicago";

  networking.hostName = "mycroft.alunduil.com";

  networking.nameservers = [
    "8.8.8.8"
    "8.8.4.4"
  ];

  networking.defaultGateway = "64.68.174.1";

  networking.interfaces.enp0s7.ip4 = [ { address = "64.68.174.57"; prefixLength = 24; } ];

  networking.localCommands = "ip route add 64.68.174.55 via 64.68.174.1";  # Thanks NVC
}
