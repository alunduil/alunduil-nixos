{ ... }:
{
  services.zfs = {
    autoScrub.enable = true;
    autoSnapshot = {
      daily = 14;
      enable = true;
      frequent = 8;
      hourly = 48;
      monthly = 24;
      weekly = 8;
    };
  };
}
