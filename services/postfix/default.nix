{ config, pkgs, ... }:
{
  services.postfix = {
    config = {
      disable_vrfy_command = "yes";
      inet_interfaces = "loopback-only";
      mynetworks = "127.0.0.0/8 [::1]/128";
      smtpd_banner = "$myhostname ESMTP";
      smtpd_helo_required = "yes";
    };
    domain = "alunduil.com";
    enable = true;
    extraConfig = builtins.readFile ./main.cf;
    hostname = config.networking.hostName + (if config.networking.domain == null then "" else "." + config.networking.domain);
    origin = "$mydomain";
    relayHost = "smtp.gmail.com";
    relayPort = 587;
    rootAlias = "alunduil+${config.networking.hostName}@gmail.com";
    mapFiles = {
      "sasl_passwords" = pkgs.requireFile rec {
        name = "sasl_passwords";
        sha256 = "05536162497wakymsyydnf9yk2g9m7ws9pgxdbm86iapchyh2gsv";
        message = ''
          You must inject a "${name}" file into your nix store to use this
          postfix configuration.  You can insert this file with the following
          command (from the directory containing ${name}):

          nix-prefetch-url file://$$PWD/${name}

          N.B., You will also need to update the hash in
          'services/postfix/default.nix' with the output of the previous
          command.

          This file contains the passwords used for SASL authentication with
          the configured MTA and is thus not included and needs to be created
          by hand.  This file is a standard postfix sasl_passwords file with
          lines following this format:

          [mail.example.com]:587 username:password
        '';
      };
    };
  };
}
