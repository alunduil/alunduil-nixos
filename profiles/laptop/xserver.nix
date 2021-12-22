{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.dmenu
    pkgs.glxinfo
    pkgs.sddm-kcm
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
        defaultSession = "sway";
        sddm = {
          enable = true;
          settings = { Wayland = { EnableHiDPI = true; }; X11 = { EnableHiDPI = true; }; };
          theme = "elarun";
        };
      };

      enable = true;

      libinput = {
        enable = true;
        touchpad = {
          accelSpeed = "1";
          disableWhileTyping = true;
        };
      };

      videoDrivers = [
        "modesetting"
        "vesa"
      ];

      windowManager = {
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
        };
      };

      xkbOptions = "compose:caps";
    };
  };
}
