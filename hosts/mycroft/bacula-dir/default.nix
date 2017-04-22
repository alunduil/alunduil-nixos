{ config, pkgs, ... }:
{ networking.firewall.allowedTCPPorts = [ 9103 ];

  services =
    { bacula-dir =
        { enable = true;
          extraConfig = builtins.readFile ./bacula-dir.conf;
          extraDirectorConfig =
            ''
            Heartbeat Interval = 30;
            '';
          extraMessagesConfig =
            let
              hostName = config.networking.hostName + "." + config.networking.domain;
            in
              ''
              MailCommand = "bsmtp -h localhost -f \"%d \<root@${hostName}\>\" -s \"[BACULA] %l %n %e\" %r"
              OperatorCommand = "bsmtp -h localhost -f \"%d \<root@${hostName}\>\" -s \"[BACULA] Intervation needed for %j\" %r"
              mail = root = all, !skipped, !restored
              operator = root = mount
              '';
          name = "mycroft.alunduil.com-dir";
          password = "998da8a46eaa434e8be8ff7fc877cf94";
        };

        dd-agent.tags =
          [ "bacula-dir"
          ];

        postgresql.package = pkgs.postgresql94;
    };
}
