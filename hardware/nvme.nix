{ ... }:
{
  services.smartd.devices = [
    {
      device = "/dev/nvme0n1";
      options = "-d nvme,0xffffffff";
    }
  ];
}
