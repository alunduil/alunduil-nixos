{ config, ... }:
{ services.kubernetes =
    { caFile = ./certificates/ca.pem;

      kubeconfig =
        { certFile = ./certificates + "/${config.networking.hostName}.pem";
          keyFile = ./certificates + "/${config.networking.hostName}-key.pem";
          server = "http://fates";
        };
      
      proxy.kubeconfig =
        { certFile = ./certificates/proxy.pem;
          keyFile = ./certificates/proxy-key.pem;
        };
    };
}
