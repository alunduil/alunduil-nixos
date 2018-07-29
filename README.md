# Description

Personal [NixOS] Configurations

Complete [Nix] configuration for all hosts I run [NixOS] on.  Including a custom
ISO for installation.

# Getting Started

## NixOS Installation Configuration

Clone this repository locally, and optionally setup a cron job to automatically
update it as frequently as you desire.  Then simply add the configuration you
want to your `/etc/nixos/configuration.nix` imports list.

## Installation ISO

Build the ISO:

```
nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=iso.nix
```

Copy the resulting ISO onto a USB drive (N.B. **IF YOU COPY PASTE THIS YOU WILL
MOST LIKELY DESTROY YOUR DATA!**):

```
dd if=result/iso/*.iso of=/dev/sd? bs=4096
```

# Reporting Issues

Any issues discovered should be recorded on [github][issues].  If you believe
you've found an improvement or typo, please ensure that it is reported.

If you would like to contribute a fix or new content, please submit a pull
request.  This project follow the [github flow] to make manual review simple.

[github flow]: https://guides.github.com/introduction/flow/
[Nix]: https://nixos.org/nixos/manual/
[NixOS]: https://nixos.org/nixos/manual/
