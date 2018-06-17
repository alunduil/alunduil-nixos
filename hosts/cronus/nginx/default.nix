{ ... }:
{
  environment.etc = {
    "dd-agent/conf.d/nginx.yaml" = {
      source = ./nginx.yaml;
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 ];

  services.dd-agent.tags = [
    "nginx"
  ];

  services.nginx = {
    config = builtins.readFile ./nginx.conf;
    enable = true;
    statusPage = true;
  };
}
