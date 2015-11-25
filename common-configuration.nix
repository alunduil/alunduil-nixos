{ config, pkgs, ... }:

{
  imports = [
    ./common-boot.nix
    ./common-networking.nix
    ./common-services.nix
    ./common-users.nix
    ./packages-my-system.nix
  ];

  environment.noXlibs = true;

  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" ];

  nix.gc.automatic = true;

  nix.useChroot = true;

  programs.zsh.enable = true;

  security.sudo.wheelNeedsPassword = false;

  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-15.09-small";

  system.stateVersion = "15.09";
}
