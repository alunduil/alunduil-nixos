{ config, pkgs, ... }:

{
  imports = [];

  services.postgresql.initialScript = ''
  CREATE ROLE datadog WITH LOGIN PASSWORD '25MxzqNQ2acQUMiaAAu60eJX';
  GRANT SELECT ON pg_stat_database TO datadog;
  '';

  services.dd-agent.postgresqlConfig = ''
  init_config:

  instances:
    - host: localhost
      port: 5432
      username: datadog
      password: 25MxzqNQ2acQUMiaAAu60eJX
  '';
}
