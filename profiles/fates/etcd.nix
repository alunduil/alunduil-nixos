{ ... }:
{ services.etcd.initialCluster =
    [ "atropos=https://atropos:2380"
      "clothio=https://clothio:2380"
      "lachesis=https://lachesis:2380"
    ];
}
