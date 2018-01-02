{ subnet, ... }:
[ { "cniVersion": "0.3.1"
  , "name": "bridge"
  , "type": "bridge"
  , "bridge": "cnio0"
  , "isGateway": true
  , "ipMasq": true
  , "ipam":
      { "type": "host-local"
      , "ranges": [ [ { "subnet": "${subnet}" } ] ]
      , "routes": [ { "dst": "0.0.0.0/0" } ]
      }
  }
  { "cniVersion": "0.3.1"
  , "type": "loopback"
  }
]
