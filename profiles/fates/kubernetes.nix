{ config, ... }:
{ services.kubernetes =
    { etcd =
        { caFile = ../../certificates/alunduil-ca.pem;
          certFile = ../../certificates/kubernetes.pem;
          servers = [ "https://atropos:2380"
                      "https://clothio:2380"
                      "https://lachesis:2380"
                    ];
          keyFile = ../../certificates/kubernetes.key;
        };

      apiserver =
        { kubeletClientCaFile = ../../certificates/alunduil-ca.pem;
          kubeletClientCertFile = ../../certificates/kubernetes.pem;
          kubeletClientClientKey = ../../certificates/kubernetes-key.pem;
        };

      kubeconfig.server = "http://fates";
    };
}
