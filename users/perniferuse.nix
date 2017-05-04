{ ... }:
{ users.users =
    { perniferuse =
        { description = "Stephanie Entinger,,,,sentinger53@gmail.com";
          isNormalUser = true;
          openssh.authorizedKeys.keys =
            [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDRaNTAaIjihtMCi1Fdqk+edb+vskecdf/2QFJGQk4sA8fqU5ne3Z7NZzc8VExnqswqy3Tv77GQ0pGOGupQJ1SuHO9lo/hao7G2n+qoxXqhJIA8glPus80Mt6dKgnat9zi2HkuVEwpmFDWxE6YihQ/0q9bACELKa+lK1DGA3d+p0RKSO7/62EiksumEWRt53ExeAdGTSAEr4FlHVk9ogwCJZSb3IRlCuipiMjPqnAIewchP7h8pkLv4AJr33WtzZHwj81r68F6FGtrolA9sserT2IhELfX4kPqUet83ZHK2NoHNMR9f94WF9V0/aWBHyE3Gig2UBYZnAS/WiiqwDMyt Acer Chromebook"
            ];
        };
    };

  services.dd-agent.tags =
    [ "perniferuse"
    ];
}
