n:
let
  hostNames =
    [ "demeter"
      "hades"
      "hera"
      "hestia"
      "poseidon"
      "zeus"
    ];
in
  assert n <= builtins.length hostNames;
  builtins.genList (builtins.elemAt hostNames) n
