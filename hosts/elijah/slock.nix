{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.slock
  ];

  security.wrappers = {
    slock = {
      source = "${pkgs.slock.out}/bin/slock";
    };
  };

  services.xserver.displayManager.sessionCommands =
    ''
    ${pkgs.xautolock}/bin/xautolock -time 3 -locker /run/wrappers/bin/slock &
    '';
}
