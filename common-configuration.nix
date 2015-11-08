{ config, pkgs, ... }:

{
  imports =
    [
      ./common-boot.nix
      ./common-networking.nix
      ./common-services.nix
      ./common-users.nix
      ./packages-my-system.nix
    ];

  environment.noXlibs = true;

  nix.gc.automatic = true;

  programs.zsh.enable = true;

  security.sudo.wheelNeedsPassword = false;

  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-15.09-small";

  system.stateVersion = "15.09";
}
