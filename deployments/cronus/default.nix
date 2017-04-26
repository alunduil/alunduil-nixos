{ cardinality ? 2 }:
let
  hostNames = import ./hostNames.nix cardinality;

  node = import ./hosts/node hostNames;

  nodes = map (h: { name = h; value = node; }) hostNames;
in
  { network.description = "Kubernetes Cluster";
    
    cronus = import ./hosts/cronus hostNames;
  } // builtins.listToAttrs nodes
