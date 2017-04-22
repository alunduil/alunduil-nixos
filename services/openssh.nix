{ ... }:
{ services.openssh =
    { challengeResponseAuthentication = false;
      enable = true;
      passwordAuthentication = false;
      permitRootLogin = "no";
      startWhenNeeded = true;
    };
}
