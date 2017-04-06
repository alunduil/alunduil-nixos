let 
  odroid-vm =
    { deployment.targetEnv = "virtualbox";
      deployment.virtualbox.memorySize = 2048;
      deployment.virtualbox.headless = true;
    };

in

{ demeter  = { networking.hostName = "demeter";
             } // odroid-vm;

  hades    = { networking.hostName = "hades";
             } // odroid-vm;

  hera     = { networking.hostName = "hera";
             } // odroid-vm;

  hestia   = { networking.hostName = "hestia";
             } // odroid-vm;

  poseidon = { networking.hostName = "poseidon";
             } // odroid-vm;

  zeus     = { networking.hostName = "zeus";
             } // odroid-vm;
}
