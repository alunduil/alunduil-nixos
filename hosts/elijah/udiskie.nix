{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.python27Packages.udiskie
  ];

  services.xserver.displayManager.sessionCommands =
    ''
    ${pkgs.python27Packages.udiskie}/bin/udiskie &
    '';
}
