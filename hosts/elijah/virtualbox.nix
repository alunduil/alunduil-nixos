{ ... }:
{ services.dd-agent.tags =
    [ "virtualbox"
      "virtualbox-host"
    ];
  
  virtualisation.virtualbox.host.enable = true;
}
