{ pkgs, ... }:
{
  environment.etc = {
    "cifs.credentials" = {
      mode = "0600";
      source = ./cifs.credentials;
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
