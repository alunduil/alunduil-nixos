{ config, pkgs, ... }:

{
  imports = [];

  fileSystems."/var/backups/laptops" = {
    device = "/dev/disk/by-uuid/add90682-ac74-40cd-b541-7d19bc579c77";
    fsType = "ext4";
    neededForBoot = true;
  };

  environment.systemPackages = with pkgs; [
    rdiff-backup
  ];

  users.users."alunduil".openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCseVsNsz+HS2rYEGQc2huIRmShg8gC2CcjfIYPu1/sO+ENehQZEEmnqpIJkhg9BtzffdsHaxKi67h1rRskDnE5yewe4s41NtVT18SAiC7YhPbgKuSo9G4Id7kfmC3QN0ddHDIcf2tE3Sr/JndqtgmTIbOYxAtLSw6MxlwnKwrsTdMuDxuzQ3NUf35l7bowCAzuOazuHs6OChGvZVyCYMMOksjkqCfWTs8GV76TI50ol9N4UYCH37Q4g71HZAo2JyHWPnjI5gREyuBxNcsL7xMgBtxCwIleJcIcZ6XVoQWFvv7s5duOMBj1veyu5lQAG1sTiPAWqvPRPYbPeUZ4fiVF alunduil@elijah"
  ];
}
