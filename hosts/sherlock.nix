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

  users.users = {
    perniferuse = {
      description = "Stephanie Entinger <sentinger53@gmail.com>";
      home = "/home/users/perniferuse";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRaNTAaIjihtMCi1Fdqk+edb+vskecdf/2QFJGQk4sA8fqU5ne3Z7NZzc8VExnqswqy3Tv77GQ0pGOGupQJ1SuHO9lo/hao7G2n+qoxXqhJIA8glPus80Mt6dKgnat9zi2HkuVEwpmFDWxE6YihQ/0q9bACELKa+lK1DGA3d+p0RKSO7/62EiksumEWRt53ExeAdGTSAEr4FlHVk9ogwCJZSb3IRlCuipiMjPqnAIewchP7h8pkLv4AJr33WtzZHwj81r68F6FGtrolA9sserT2IhELfX4kPqUet83ZHK2NoHNMR9f94WF9V0/aWBHyE3Gig2UBYZnAS/WiiqwDMyt Acer Chromebook"
      ];
    };
  };
}
