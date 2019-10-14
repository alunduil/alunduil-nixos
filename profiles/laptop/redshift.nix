{ ... }:
{
  location.provider = "geoclue2";

  services.redshift = {
    enable = true;
    extraOptions = [
      "-m randr"
    ];

    temperature = {
      day = 6500;
      night = 1500;
    };
  };
}
