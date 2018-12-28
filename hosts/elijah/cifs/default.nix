{ pkgs, ... }:
{
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
      options = [
        "gid=users"
        "noauto"
        "nofail"
        "uid=alunduil"
        "x-systemd.automount"
        "x-systemd.device-timeout=10s"
        "x-systemd.idle-timeout=30s"
        "credentials=/etc/cifs.credentials"
      ];
    in
    {
      "/media/freenas/documents" = {
        device = "//freenas/documents";
        fsType = "cifs";
        options = options;
      };

      "/media/freenas/media" = {
        device = "//freenas/media";
        fsType = "cifs";
        options = options;
      };

      "/media/freenas/scans" = {
        device = "//freenas/scans";
        fsType = "cifs";
        options = options;
      };
    };
}
