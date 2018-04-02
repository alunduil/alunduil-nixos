{ pkgs, ... }:
{ environment.etc =
    { "cifs.credentials" =
        { mode = "0600";
          source = ./cifs.credentials;
        };
    };

  environment.systemPackages =
    [ pkgs.cifs-utils
    ];

  fileSystems =
    let
      options =
        [ "credentials=/etc/cifs.credentials"
          "gid=users"
          "noauto"
          "nofail"
          "uid=alunduil"
          "vers=1.0"
          "x-systemd.automount"
          "x-systemd.device-timeout=10s"
          "x-systemd.idle-timeout=30s"
        ];
    in
      { "/media/nas/documents" =
          { device = "//nas/Documents";
            fsType = "cifs";
            options = options;
          };

        "/media/nas/media" =
          { device = "//nas/Media";
            fsType = "cifs";
            options = options;
          };

        "/media/nas/scanned" =
          { device = "//nas/Scanned";
            fsType = "cifs";
            options = options;
          };
      };
}
