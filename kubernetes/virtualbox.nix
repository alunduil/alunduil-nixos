let 
  hostNames = import ./hostnames.nix;

  node =
    { hostName, ... }:
    { networking.hostName = hostName;
    } // odroid-vm;

  odroid-vm =
    { deployment.targetEnv = "virtualbox";
      deployment.virtualbox.memorySize = 2048;
      deployment.virtualbox.headless = true;
    };
in
  builtins.listToAttrs (builtins.map (h: { name = h; value = (node { hostName = h; }); }) hostNames)
