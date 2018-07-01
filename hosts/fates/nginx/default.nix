{ ... }:
{
  networking.firewall.allowedTCPPorts = [ 80 ];

  services.nginx = {
    config = builtins.readFile ./nginx.conf;
    enable = true;
    statusPage = true;
  };
}
