{ pkgs, ... }:
{ networking.firewall.allowedUDPPorts = [ 5353 ];
}
