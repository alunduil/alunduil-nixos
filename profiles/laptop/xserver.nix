{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.dmenu
    pkgs.glxinfo
    pkgs.xclip
    pkgs.xorg.xev
    pkgs.xorg.xkill
  ];

  services = {
    compton = {
      backend = "glx";
      enable = true;
    };

    xserver = {
      displayManager = {
        defaultSession = "gnome";
        gdm.enable = true;
      };

      enable = true;

      libinput = {
        enable = true;
        touchpad = {
          accelSpeed = "1.5";
          disableWhileTyping = true;
        };
      };

      videoDrivers = [
        "modesetting"
        "vesa"
      ];

      desktopManager.gnome.enable = true;

      xkbOptions = "compose:caps";
    };
  };
}
