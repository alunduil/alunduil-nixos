{ ... }:
{ boot.loader.grub.devices =
    [ "/dev/disk/by-id/ata-WDC_WD800JD-60LSA5_WD-WMAM9EV35606"
      "/dev/disk/by-id/ata-WDC_WD800JD-60LSA5_WD-WMAM9EV35973"
    ];

  fileSystems =
    { "/var/spool/mail" =
        { device = "/dev/disk/by-uuid/ec8312c4-20b0-4689-af8c-8df30fc4abb1";
          fsType = "ext4";
          neededForBoot = true;
        };
    };

  hardware.cpu.amd.updateMicrocode = true;

  networking =
    { defaultGateway = "64.68.174.1";

      interfaces =
        { "enp0s7" =
            [ { address = "64.68.174.56";
                prefixLength = 24;
              }
            ];
        };

      localCommands =
        ''
        ip route add 64.68.174.54 via 64.68.174.1;
        ip route add 64.68.174.55 via 64.68.174.1;
        '';

      nameservers =
        [ "8.8.8.8"
          "8.8.4.4"
        ];
    };

  services.dd-agent.tags =
    [ "compaq"
      "desktop"
    ];
}
