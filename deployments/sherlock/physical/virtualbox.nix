{ sherlock =
    { deployment =
        { targetEnv = "virtualbox";
          virtualbox.headless = true;
          virtualbox.memorySize = 8192;
        };

      services.dd-agent.tags =
        [ "virtualbox"
          "virtualbox-guest"
        ];
    };
}
