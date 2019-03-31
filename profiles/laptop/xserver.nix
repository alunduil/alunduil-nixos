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
      displayManager.sddm = {
        enable = true;
        extraConfig = ''
          [Wayland]
          EnableHiDPI=true

          [X11]
          EnableHiDPI=true
        '';
        theme = "elarun";
      };

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
  };
}
