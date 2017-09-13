{ pkgs, ... }:
{ environment.systemPackages =
    [ pkgs.dmenu
    ];
      
  services.xserver =
    { displayManager =
        { job.logsXsession = true;

          sddm.enable = true;
        };

      enable = true;

      synaptics =
        { accelFactor = "0.02";
          enable = true;
          horizEdgeScroll = false;

          maxSpeed = "1.0";
          minSpeed = "0.6";

          palmDetect = true;
          tapButtons = false;

          vertEdgeScroll = false;
          vertTwoFingerScroll = true;
        };

      videoDrivers =
        [ "intel"
          "vesa"
          "modesetting"
        ];

      windowManager =
        { default = "xmonad";

          xmonad =
            { enable = true;
              enableContribAndExtras = true;
            };
        };
    };
}
