let
  odroid-vm = {
    deployment.virtualbox.memorySize = 2048;
  } // common;

  common = {
    deployment = {
      targetEnv = "virtualbox";
      virtualbox.headless = true;
    };

    services.dd-agent.tags = [
      "cronus"
      "virtualbox"
      "virtualbox-guest"
    ];
  };
in
  {
    cronus = {
      deployment.virtualbox.memorySize = 256;
    } // common;

    demeter  = odroid-vm;
    hades    = odroid-vm;
    hera     = odroid-vm;
    hestia   = odroid-vm;
    poseidon = odroid-vm;
    zeus     = odroid-vm;
  }
