let
  odroid-vm =
    { deployment =
        { targetEnv = "libvirtd";
          libvirtd =
            { headless = true;
              memorySize = 2048;
              vcpu = 4;
            };
        };

      services.dd-agent.tags =
        [ "fates"
          "libvirtd"
          "libvirtd-guest"
        ];
    };
in
{ fates =
    { deployment =
        { targetEnv = "libvirtd";
          libvirtd =
            { headless = true;
              memorySize = 256;
            };
        };

      services.dd-agent.tags =
        [ "fates"
          "libvirtd"
          "libvirtd-guest"
        ];
    };

  atropos  = odroid-vm;
  clothio  = odroid-vm;
  lachesis = odroid-vm;
}
