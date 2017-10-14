{ ... }:
{ imports =
    [ ../../services/bacula-fd.nix
    ];

  networking.firewall.extraCommands = ''
  iptables -A nixos-fw -s 64.68.174.54 -p tcp --dport 9102 -j nixos-fw-accept
  '';
}
