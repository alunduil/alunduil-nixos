{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.dmenu
    pkgs.fvwm
    pkgs.glxinfo
    pkgs.sddm-kcm
    pkgs.xclip
    pkgs.xorg.xev
    pkgs.xorg.xkill
  ];

  services.xserver = {
    displayManager.sddm.enable = true;

    enable = true;

    libinput = {
      accelSpeed = "1";
      disableWhileTyping = true;
      enable = true;
    };

    videoDrivers = [
      "modesetting"
      "vesa"
    ];

    windowManager = {
      default = "xmonad";

      xmonad = {
        enable = true;
        enableContribAndExtras = true;
      };
    };

    xkbOptions = "compose:caps";
  };
}
