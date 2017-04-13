{ ... }:
{ services.dd-agent.tags =
    [ "virtualbox"
    ];
  
  virtualisation.virtualbox.host.enable = true;
}
