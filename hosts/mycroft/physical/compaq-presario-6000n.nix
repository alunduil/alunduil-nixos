{ ... }:
{ boot.loader.grub.devices =
    [ "/dev/disk/by-id/ata-WDC_WD800JD-75MSA3_WD-WMAM9DLZ6740"
      "/dev/disk/by-id/ata-WDC_WD800JD-75MSA3_WD-WMAM9DLS6552"
    ];

  fileSystems =
    builtins.listToAttrs
      [ { name = config.services.postgresql.dataDir;
          value =
            { device = "/dev/disk/by-uuid/8db66416-4a8a-4f89-b828-55cb2b2ded50";
              fsType = "ext4";
              neededForBoot = true;
              options =
                [ "nobarrier"
                ];
            };
        }
        { name = config.services.bacula-sd.device."USB-RAID".archiveDevice;
          value =
            { device = "/dev/disk/by-uuid/834d4738-7843-4d98-9c98-70efc31dc6f0";
              fsType = "ext4";
              neededForBoot = true;
              options =
                [ "nobarrier"
                ];
            };
        }
      ];

  hardware.cpu.amd.updateMicrocode = true;

  networking =
    { defaultGateway = "64.68.174.1";

      interfaces =
        { "enp0s7" =
            [ { address = "64.68.174.54";
                prefixLength = 24;
              }
            ];
        };

      localCommands =
        ''
        ip route add 64.68.174.56 via 64.68.174.1
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
