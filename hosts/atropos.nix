{ ... }:
{ imports =
    [ ../profiles/fates
      ../system.nix
    ];

  environment.noXlibs = true;

  networking =
    { hostName = "atropos";
    };

  services.kubernetes.kubelet.cni.config =
    import ../profiles/kubernetes/generators/cni.nix { subnet = "10.200.0.0/24"; };

  sound.enable = false;

  time.timeZone = "America/Chicago";

  users.mutableUsers = false;
}
