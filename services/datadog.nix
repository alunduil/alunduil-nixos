{ config, ... }:
{
  services.dd-agent = {
    api_key = "d20ee6eba771d3e1abaec913d9432b8f";
    enable = true;
    hostname = config.networking.hostName;
  };
}
