{ ... }:
{ services =
    { geoclue2.enable = true;
      
      redshift =
        { enable = true;
          extraOptions =
            [ "-m randr"
            ];

          latitude = "37.484304";
          longitude = "-122.145815";

          temperature =
            { day = 6500;
              night = 1500;
            };
        };
    };
}
