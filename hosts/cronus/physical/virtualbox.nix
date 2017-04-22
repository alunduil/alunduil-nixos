{ cardinality ? 2 }:
let
  hostNames = import ../hostNames.nix cardinality;

  node =
    hostName:
    { networking.hostName = hostName;
    } // odroid-vm;

  odroid-vm =
    { deployment.virtualbox.memorySize = 2048;
    } // common;

  common =
    { deployment =
        { targetEnv = "virtualbox";
          virtualbox.headless = true;
        };
        
      services.dd-agent.tags =
        [ "virtualbox"
          "virtualbox-guest"
        ];
    };
in
  { cronus =
      { networking.hostName = "cronus";

        deployment.virtualbox.memorySize = 256;
      } // common;
  } // builtins.listToAttrs (map (h: { name = h; value = (node h); }) hostNames)
