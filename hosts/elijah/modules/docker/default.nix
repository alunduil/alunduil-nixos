{ ... }:
{ environment.etc =
    { "dd-agent/conf.d/docker_daemon.yaml" =
        { source = ./docker_daemon.yaml;
        };
    };

  services.dd-agent.tags =
    [ "docker"
    ];

  users.users =
    { datadog =
        { extraGroups =
            [ "docker"
            ];
        };
    };

  virtualisation.docker =
    { enable = true;
      storageDriver = "btrfs";
    };
}
