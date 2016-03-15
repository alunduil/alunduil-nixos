{ config, pkgs, ... }:

{
  imports = [];

  services.dd-agent.enable = true;
  services.dd-agent.hostname = config.networking.hostName;
  services.dd-agent.api_key = "d20ee6eba771d3e1abaec913d9432b8f";
}
