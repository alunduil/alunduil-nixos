{ pkgs, ... }:
{
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    extraPackages = [
      pkgs.alacritty
      pkgs.dmenu
      pkgs.mako
      pkgs.swayidle
      pkgs.swaylock
      pkgs.wl-clipboard
    ];
  };
}
