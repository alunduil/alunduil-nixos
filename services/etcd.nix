{ config, pkgs, ... }:
{
  networking.firewall.allowedTCPPorts = [ 2379 2380 ];

  services.etcd = {
    advertiseClientUrls = [ ("http://" + config.networking.hostName + ":2379") ];
    discovery = "https://discovery.etcd.io/3c67eda0838ddb2cee68a9cbbee84e60";
    enable = true;
    listenClientUrls = [ ("http://" + config.networking.hostName + ":2379") "http://localhost:2379" ];
    listenPeerUrls = [ ("http://" + config.networking.hostName + ":2380") ];
    name = config.networking.hostName;
  };
}
