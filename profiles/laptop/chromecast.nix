{ ... }:
{
  networking.firewall.allowedUDPPortRanges = [
    { from = 32768; to = 61000; }
  ];
}
