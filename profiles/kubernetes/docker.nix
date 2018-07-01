{ ... }:
{
  imports = [
    ../../services/docker.nix
  ];

  networking = {
    bridges.cbr0.interfaces = [];

    interfaces = {
      "cbr0" = {
        ipAddress = "10.10.0.1";
        prefixLength = 24;
      };
    };
  };

  virtualisation.docker.extraOptions =
    let
      options = [
        "--bridge=cbr0"
        "--ip-masq=false"
        "--iptables=false"
      ];
    in
    builtins.concatStringsSep " " options;
}
