{ config, pkgs, ... }:

{
  imports = [];

  security.sudo.wheelNeedsPassword = false;
};
