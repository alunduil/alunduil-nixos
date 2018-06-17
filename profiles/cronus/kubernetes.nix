{ config, ... }:
{
  services.kubernetes = {
    etcd = {
      caFile = ../../certificates/alunduil-ca.pem;
      certFile = ../../certificates/cronus-kubernetes.pem;
      servers = [
        "https://demeter:2380"
        "https://hades:2380"
        "https://hera:2380"
        "https://hestia:2380"
        "https://poseidon:2380"
        "https://zeus:2380"
      ];
      keyFile = ../../certificates/cronus-kubernetes.key;
    };

    apiserver = {
      kubeletClientCaFile = ../../certificates/alunduil-ca.pem;
      kubeletClientCertFile = ../../certificates/cronus-kubernetes.pem;
      kubeletClientClientKey = ../../certificates/cronus-kubernetes-key.pem;
    };

    kubeconfig.server = "http://cronus";
  };
}
