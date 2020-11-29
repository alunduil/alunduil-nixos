{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.udiskie
  ];

  services.xserver.displayManager.sessionCommands =
    ''
      ${pkgs.udiskie}/bin/udiskie &
    '';
}
