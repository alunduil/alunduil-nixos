{ ... }:
{ services =
    { geoclue2.enable = true;
      
      redshift =
        { enable = true;
          extraOptions =
            [ "-m randr"
            ];

          latitude = "37.488836";
          longitude = "-122.228826";

          temperature =
            { day = 6500;
              night = 1500;
            };
        };
    };
}
