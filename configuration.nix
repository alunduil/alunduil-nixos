{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix  # Include the results of the hardware scan.
    ];

  boot.enableContainers = false;

  boot.extraKernelParams = [ "ipv6.disable=1" ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    devices = [ "/dev/sda" "/dev/sdb" ];
  };

  boot.tmpOnTmpfs = true;

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  # environment.systemPackages = with pkgs; [
  #   wget
  # ];

  networking.domain = "alunduil.com";
  networking.hostName = "daneel";

  networking.enableIPv6 = false;
  networking.interfaceMonitor.beep = true;
  networking.tcpcrypt.enable = true;

  networking.firewall.allowPing = true;

  nix.gc.automatic = true;

  programs.zsh.enable = true;

  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";
  services.openssh.startWhenNeeded = true;

  services.uptimed.enable = true;
  services.postfix.enable = true;

  users.mutableUsers = false;

  users.users = {
    alunduil = {
      description = "Alex Brandt <alunduil@alunduil.com>";
      extraGroups = [ "wheel" ];
      home = "/home/custodians/alunduil";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/tAlaJTcXl1JFOEENDv+4MucWw+Kbgmm2HotivfeYNpSofsYfF+u2qmtmPbElPeGn5XP17jOHWzJhFfX+ErCFE2/hxc5+uaMOSthRhEJ2E2KELEYIGMhtJ1Ao96321pa4tWpKO6C0M0v2PoIDk1rBOny9EnHXykAtoSycNUsy3IgCNKTFXwJx0a9C/znHwHiYrxTkkKpAymNnMciDkx99t8wJfOHfblj9z0A6bsDEo/MMNbrStO7AotSo2ir+/p3r3uNDgWI3XnDqhrf/IBKVJs27G8cWwY+1PwwSSEoCoN/6lRFRnG0IS54z/HvhxOOZuQOIECFwKkiSm1mElxWyDnUQaWu4hZAucNIvFFfBusk5oilrYq6ENx4gWgQQVP5a7lt+OhvKyVFLmkqfxx2VzrKa5yWE6lcZhNLDw7duVOmSu86QGLw+mBmYAvDuJfNth9UAOub3iob/NPqe9xGUAHtOyXb9fhubVl6HfMwiAmxy43szQ2UAtQFphwhwsrsGCHlHu1qIzuGFYDfJL0nW6WhN+XGHS5kUqjAeFKpiahauFqbpL7fv7Q1NY3ceLNqaD+aMhWh3zhnVOY3oi5ft+qlSpUacN4+wL25L9GX8NhbSerl8GXPooun+GpAReYuEwHPBs0XZ9xSLdjZ8/wWw2b5e5RMyx74bsd+3CKjyUw== cardno:000500002906"
      ];
      shell = "/run/current-system/sw/bin/zsh";
    };
  };

  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-15.09-small";

  system.stateVersion = "15.09";

  time.timeZone = "America/Chicago";
}
