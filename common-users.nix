{ config, pkgs, ... }:

{
  imports = [];

  users.mutableUsers = false;

  users.users = {
    alunduil = {
      description = "Alex Brandt <alunduil@alunduil.com>";
      extraGroups = [ "wheel" ];
      home = "/home/custodians/alunduil";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/tAlaJTcXl1JFOEENDv+4MucWw+Kbgmm2HotivfeYNpSofsYfF+u2qmtmPbElPeGn5XP17jOHWzJhFfX+ErCFE2/hxc5+uaMOSthRhEJ2E2KELEYIGMhtJ1Ao96321pa4tWpKO6C0M0v2PoIDk1rBOny9EnHXykAtoSycNUsy3IgCNKTFXwJx0a9C/znHwHiYrxTkkKpAymNnMciDkx99t8wJfOHfblj9z0A6bsDEo/MMNbrStO7AotSo2ir+/p3r3uNDgWI3XnDqhrf/IBKVJs27G8cWwY+1PwwSSEoCoN/6lRFRnG0IS54z/HvhxOOZuQOIECFwKkiSm1mElxWyDnUQaWu4hZAucNIvFFfBusk5oilrYq6ENx4gWgQQVP5a7lt+OhvKyVFLmkqfxx2VzrKa5yWE6lcZhNLDw7duVOmSu86QGLw+mBmYAvDuJfNth9UAOub3iob/NPqe9xGUAHtOyXb9fhubVl6HfMwiAmxy43szQ2UAtQFphwhwsrsGCHlHu1qIzuGFYDfJL0nW6WhN+XGHS5kUqjAeFKpiahauFqbpL7fv7Q1NY3ceLNqaD+aMhWh3zhnVOY3oi5ft+qlSpUacN4+wL25L9GX8NhbSerl8GXPooun+GpAReYuEwHPBs0XZ9xSLdjZ8/wWw2b5e5RMyx74bsd+3CKjyUw== cardno:000500002906"
      ];
      shell = "/run/current-system/sw/bin/zsh";
    };
  };
}
