{ config, ... }:
{ environment.etc =
    { "bacula/bconsole.conf" =
        { mode = "0660";
          source = ./bconsole.conf;
        };
    };

  services.bacula-fd =
    { enable = true;
      name = "elijah.laptops.alunduil.com-fd";
      director =
        { "mycroft.alunduil.com-dir" =
            { password = "998da8a46eaa434e8be8ff7fc877cf94";
            };
        };
    };

  services.cron.systemCronJobs =
    [ "&runatreboot,runonce(true) * * * * * for D in /dev/?d?; do sfdisk -d $D; done 2>/dev/null | sed -e 's/label: gpt/\\n&/g' > /home/partitions.txt"
    ];

  services.dd-agent.tags =
    [ "bacula-fd"
    ];
}
