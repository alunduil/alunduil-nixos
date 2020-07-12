{ pkgs, ... }:
{
  boot.kernelModules = [ "md4" ];

  environment.etc = {
    "cifs.credentials" = {
      mode = "0600";
      source = pkgs.requireFile rec {
        name = "cifs.credentials";
        sha256 = "0dyzqb2qm3fzsny9rkhw47jbkspxz00jkwcrz86hrr0yfjvhhqxj";
        message = ''
          You must inject a "${name}" file into your nix store to use this cifs
          configuration.  You can insert this file with the following command
          (from the directory containing ${name}):

          nix-prefetch-url file://\$PWD/${name}

          N.B., You will also need to update the hash in
          'hosts/elijah/cifs/default.nix' with the output of the previous
          command.

          This file contains the passwords used for CIFS authentication with
          the configured servers.  This file is passed to the mount.cifs
          credentials option and takes its format:

          username=username
          password=password
          '';
      };
    };
  };

  environment.systemPackages = [
    pkgs.cifs-utils
  ];

  fileSystems =
    let
      filesystem = name: {
        name = "/media/freenas/${name}";
        value = {
          device = "//freenas.lan/${name}";
          fsType = "cifs";
          noCheck = true;
          options = [
            "uid=alunduil"
            "gid=users"
            "credentials=/etc/cifs.credentials"
            "x-systemd.automount"
            "x-systemd.idle-timeout=30s"
          ];
        };
      };
    in builtins.listToAttrs [
      (filesystem "documents")
      (filesystem "media")
      (filesystem "scans")
    ];
}
