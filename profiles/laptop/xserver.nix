{ pkgs, ... }:
{
  services = {
    xserver = {
      displayManager = {
        defaultSession = "gnome";
        gdm.enable = true;
      };

      enable = true;

      videoDrivers = [
        "modesetting"
        "vesa"
      ];

      desktopManager.gnome.enable = true;

      xkbOptions = "compose:caps";
    };
  };
}
