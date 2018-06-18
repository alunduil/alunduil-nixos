{ config, pkgs, ... }:
{
  environment.etc = {
    "dd-agent/conf.d/postfix.yaml" = {
      source = ./postfix.yaml;
    };
  };

  security.sudo.extraConfig =
    ''
    datadog ALL=(ALL) NOPASSWD:${pkgs.findutils.out}/bin/find
    '';

  services.dd-agent.tags = [
    "postfix"
  ];

  services.postfix = {
    domain = "alunduil.com";
    enable = true;
    extraConfig = builtins.readFile ./main.cf;
    hostname = config.networking.hostName + (if config.networking.domain == null then "" else "." + config.networking.domain);
    origin = "$mydomain";
    relayHost = "smtp.gmail.com";
    relayPort = 587;
    rootAlias = "alunduil+${config.networking.hostName}@gmail.com";
    mapFiles = {
      "sasl_passwords" = ./sasl_passwords;
    };
  };
}
