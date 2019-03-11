{ pkgs, ... }:
{
  imports = [
    ../../services/postfix
  ];

  services.postfix.hostname = pkgs.lib.mkForce "elijah.laptops.alunduil.com";
}
