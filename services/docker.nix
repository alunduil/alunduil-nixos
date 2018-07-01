{ ... }:
{
  users.users = {
    datadog = {
      extraGroups = [
        "docker"
      ];
    };
  };

  virtualisation.docker = {
    autoPrune.enable = true;
    enable = true;
  };
}
