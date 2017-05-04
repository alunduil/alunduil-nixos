{ ... }:
{ services.etcd.initialCluster =
    [ "demeter=http://demeter:2380"
      "hades=http://hades:2380"
      "hera=http://hera:2380"
      "hestia=http://hestia:2380"
      "poseidon=http://poseidon:2380"
      "zeus=http://zeus:2380"
    ];
}
