{ ... }:
{
  environment.etc = {
    "dd-agent/conf.d/btrfs.yaml" = {
      source = ./btrfs.yaml;
    };
  };

  services.dd-agent.tags = [
    "btrfs"
  ];
}
