{ config, pkgs, ... }:

{
  imports = [];

  programs.zsh.enable = true;

  environment.shells = [ "${pkgs.zsh}/bin/zsh" ];

  environment.systemPackages = with pkgs; [
    git
    htop
    vim
  ];
}
