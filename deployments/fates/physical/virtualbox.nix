let
  odroid-vm =
    { deployment.virtualbox.memorySize = 2048;
    } // common;

  common =
    { deployment =
        { targetEnv = "virtualbox";
          virtualbox.headless = true;
        };
        
      services.dd-agent.tags =
        [ "fates"
          "virtualbox"
          "virtualbox-guest"
        ];
    };
in
{ fates =
    { deployment.virtualbox.memorySize = 256;
    } // common;

  atropos  = odroid-vm;
  clothio  = odroid-vm;
  lachesis = odroid-vm;
}
