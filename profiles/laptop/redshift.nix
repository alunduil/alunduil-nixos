{ ... }:
{
  services.redshift = {
    enable = true;
    extraOptions = [
      "-m randr"
    ];

    provider = "geoclue2";

    temperature = {
      day = 6500;
      night = 1500;
    };
  };
}
