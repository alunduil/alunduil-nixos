let
  odroid-vm =
    common //
    { deployment.virtualbox.memorySize = 2048;
    };

  common =
    { deployment =
        { targetEnv = "virtualbox";
          virtualbox.headless = true;
        };
        
      services.dd-agent.tags =
        [ "cronus"
          "virtualbox"
          "virtualbox-guest"
        ];
    };
in
{ cronus =
    common //
    { deployment.virtualbox.memorySize = 256;
    };

  demeter  = odroid-vm;
  hades    = odroid-vm;
  hera     = odroid-vm;
  hestia   = odroid-vm;
  poseidon = odroid-vm;
  zeus     = odroid-vm;
}
