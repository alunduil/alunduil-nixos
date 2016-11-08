{ config, pkgs, ... }:

{
  imports = [
    ../system/backups.nix
    ../system/mail.nix
    ../system/monitoring.nix
    ../system/services/smart.nix
    ../system/updating.nix
  ];

  hardware = {
    bluetooth.enable = true;
    cpu.intel.updateMicrocode = true;
    pulseaudio.enable = true;
    pulseaudio.package = pkgs.pulseaudioFull;
  };

  time.timeZone = "America/Chicago";

  nixpkgs.config.allowUnfree = true;

  networking.hostName = "elijah.laptops.alunduil.com";
  networking.domain = "alunduil.com";

  networking.firewall.allowPing = true;
  networking.networkmanager.enable = true;

  programs.zsh.enable = true;
  environment.shells = [ "${pkgs.zsh}/bin/zsh" ];

  environment.sessionVariables = {
    EDITOR = "vim";
    NIXPKGS_ALLOW_UNFREE = "1";
  };

  environment.systemPackages = with pkgs; [
    chromium
    compton
    dmenu
    git
    gnupg
    htop
    iotop
    irssi
    lsof
    mutt
    ncdu
    pavucontrol
    pciutils
    slock
    tmux
    tree
    unclutter
    vim
    wget
    wgetpaste
    xautolock
  ] ++ (with python27Packages; [ docker_compose goobook udiskie ]);

  services.acpid.enable = true;
  services.upower.enable = true;
  services.pcscd.enable = true;

  services.dd-agent.tags = [ "alunduil" ];

  services.postfix.extraConfig = ''
    smtp_sasl_auth_enable = yes
    smtp_sasl_password_maps = regexp:/var/lib/postfix/conf/sasl_passwords
    smtp_sasl_security_options = noanonymous
  '';

  services.xserver = {
    enable = true;
    layout = "us";

    synaptics = {
      enable = true;
      minSpeed = "0.1";
      maxSpeed = "4.0";
      accelFactor = "0.4";

      tapButtons = false;
      palmDetect = true;

      twoFingerScroll = true;
      vertEdgeScroll = false;
      horizontalScroll = true;
    };

    displayManager = {
      slim = {
        enable = true;
        autoLogin = false;
        defaultUser = "alunduil";
        theme = pkgs.fetchurl {
          url = "mirror://sourceforge/slim.berlios/slim-rear-window.tar.gz";
          sha256 = "0b123706ccb67e94f626c183530ec5732b209bab155bc661d6a3f5cd5ee39511";
        };
      };

      sessionCommands = ''
        ${pkgs.compton}/bin/compton -b &
        ${pkgs.python27Packages.udiskie}/bin/udiskie &
        ${pkgs.unclutter}/bin/unclutter -root -visible -idle 2 &
        ${pkgs.xautolock}/bin/xautolock -time 3 -locker slock &
      '';
    };

    desktopManager = {
      default = "none";
    };

    windowManager = {
      default = "xmonad";
      xmonad.enable = true;
      xmonad.enableContribAndExtras = true;
    };
  };

  security.sudo.wheelNeedsPassword = false;
  security.setuidPrograms = [ "slock" ];

  users.users = {
    alunduil = {
      description = "Alex Brandt <alunduil@alunduil.com>";
      extraGroups = [ "wheel" "networkmanager" "docker" ];
      home = "/home/alunduil";
      isNormalUser = true;
      shell = "/run/current-system/sw/bin/zsh";
    };
  };

  virtualisation.docker.enable = true;
  virtualisation.docker.storageDriver = "btrfs";

  fonts = {
    enableDefaultFonts = true;
    enableFontDir = true;

    fonts = with pkgs; [ hack-font ];
  };
}
