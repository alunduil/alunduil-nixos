hostNames:
{ ... }:
{ imports =
    [ ../../common.nix
      ./nginx
    ];
    
  services.nginx.config =
    ''
    events {}

    http {
      upstream cronus {
    '' + builtins.concatStringsSep "" (map (h: "    server ${h};\n") hostNames) + ''
      }

      server {
        listen 80;

        location / {
          proxy_pass http://cronus;
        }
      }
    }
    '';
}
