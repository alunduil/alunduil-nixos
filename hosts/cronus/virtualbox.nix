let
  hostNames = import ./hostNames.nix;

  node =
    hostName:
    { networking.hostName = hostName;
    } // odroid-vm;

  odroid-vm =
    { deployment.targetEnv = "virtualbox";
      deployment.virtualbox.memorySize = 2048;
      deployment.virtualbox.headless = true;
    };
in
  { proxy =
      { networking.hostName = "proxy";
        deployment.targetEnv = "virtualbox";
        deployment.virtualbox.memorySize = 256;
        deployment.virtualbox.headless = true;
      };
  } // builtins.listToAttrs (map (h: { name = h; value = (node h); }) hostNames)
