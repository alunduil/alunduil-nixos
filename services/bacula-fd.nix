{ config, ... }:
{
  boot.kernel.sysctl = {
    "net.ipv4.tcp_keepalive_time" = 30;
  };

  services.bacula-fd = {
    director = {
      "mycroft.alunduil.com-dir" = {
        password = "998da8a46eaa434e8be8ff7fc877cf94";
      };
    };
    enable = true;
    extraClientConfig =
      ''
      Heartbeat Interval = 30
      '';
    name = if config.networking.domain == null
              then config.networking.hostName + "-fd"
              else config.networking.hostName + "." + config.networking.domain + "-fd";
  };

  services.cron.systemCronJobs = [
    "&runatreboot,runonce(true) * * * * * for D in /dev/?d?; do sfdisk -d $D; done 2>/dev/null | sed -e 's/label: gpt/\\n&/g' > /home/partitions.txt"
  ];
}
