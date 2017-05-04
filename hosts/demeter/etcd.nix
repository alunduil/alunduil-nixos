{ ... }:
{ services.etcd.initialCluster =
    [ "demeter=https://demeter:2380"
      "hades=https://hades:2380"
      "hera=https://hera:2380"
      "hestia=https://hestia:2380"
      "poseidon=https://poseidon:2380"
      "zeus=https://zeus:2380"
    ];
}
