{ config, ... }:
{ services.kubernetes =
    { etcd =
        { caFile = certificates/ca.pem;
          certFile = certificates/kubernetes-etcd.pem;
          servers = [ "https://atropos:2380"
                      "https://clothio:2380"
                      "https://lachesis:2380"
                    ];
          keyFile = certificates/kubernetes-etcd.key;
        };

      apiserver =
        { clientCaFile = certificates/ca.pem;
          kubeletClientCaFile = certificates/ca.pem;
          kubeletClientCertFile = certificates/kubelet-client.pem;
          kubeletClientKeyFile = certificates/kubelet-client.key;
        };

      kubeconfig =
        { caFile = certificates/ca.pem;
          certFile = certificates/kubernetes-proxy.pem;
          keyFile = certificates/kubernetes-proxy.key;
          server = "http://fates";
        };
    };
}
