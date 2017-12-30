{ ... }:
{ services.dd-agent.tags =
    [ "libvirtd"
      "libvirtd-host"
    ];

  networking.firewall.checkReversePath = false;

  virtualisation.libvirtd.enable = true;
}
