{ ... }:
{ services =
    { geoclue2.enable = true;
      
      redshift =
        { enable = true;
          extraOptions =
            [ "-m randr"
            ];

          latitude = "30.269095";
          longitude = "-97.752084";

          temperature =
            { day = 6500;
              night = 1500;
            };
        };
    };
}
