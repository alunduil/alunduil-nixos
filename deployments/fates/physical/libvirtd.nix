let
  odroid-vm =
    { deployment.libvirtd.memorySize = 2048;
    } // common;

  common =
    { deployment =
        { targetEnv = "libvirtd";
          libvirtd.headless = true;
        };

      services.dd-agent.tags =
        [ "fates"
          "libvirtd"
          "libvirtd-guest"
        ];
    };
in
{ fates =
    { deployment.libvirtd.memorySize = 256;
    } // common;

  atropos  = odroid-vm;
  clothio  = odroid-vm;
  lachesis = odroid-vm;
}
