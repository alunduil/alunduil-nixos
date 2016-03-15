{ config, pkgs, ... }:

{
  imports = [];

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    git
    htop
    vim
  ];
}
