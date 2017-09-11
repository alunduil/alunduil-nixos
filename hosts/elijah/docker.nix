{ ... }:
{ imports =
    [ ../../services/docker
    ];
  
  services.dd-agent.tags =
    [ "docker"
      "docker-host"
    ];

  virtualisation.docker.storageDriver = "btrfs";
}
