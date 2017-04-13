{ ... }:
{ services =
    { geoclue2.enable = true;
      
      redshift =
        { enable = true;
          extraOptions =
            [ # "-l geoclue2"
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
