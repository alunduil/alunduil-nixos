{ config, pkgs, ... }:

{
  imports = [];

  services.dd-agent.tags = [ "bacula-dir" ];

  services.postgresql.package = pkgs.postgresql94;

  networking.firewall.allowedTCPPorts = [ 9103 ];

  services.bacula-dir.enable = true;
  services.bacula-dir.name = config.networking.hostName + "-dir";
  services.bacula-dir.password = "998da8a46eaa434e8be8ff7fc877cf94";

  services.bacula-dir.extraDirectorConfig = ''
  Heartbeat Interval = 30;
  '';

  services.bacula-dir.extraMessagesConfig = ''
  MailCommand = "bsmtp -h localhost -f \"%d \<root@${config.networking.hostName}\>\" -s \"[BACULA] %l %n %e\" %r"
  OperatorCommand = "bsmtp -h localhost -f \"%d \<root@${config.networking.hostName}\>\" -s \"[BACULA] Intervation needed for %j\" %r"
  mail = root = all, !skipped, !restored
  operator = root = mount
  '';

  services.bacula-dir.extraConfig = ''
  Job {
    Name = elijah.laptops.alunduil.com-EVERYTHING
    JobDefs = BACKUP-DEFAULTS
    Client = elijah.laptops.alunduil.com
    FileSet = EVERYTHING
    Messages = Standard
    Enabled = yes
    Schedule = NEVER
    Priority = 5
    Cancel Queued Duplicates = yes
  }

  Job {
    Name = home.alunduil.com-NAS-DOCUMENTS
    JobDefs = NAS-DEFAULTS
    Client = home.alunduil.com
    FileSet = NAS-DOCUMENTS
    Messages = Standard
    Enabled = yes
    Priority = 6
    Client Run Before Job = "/bin/sh -c 'ls /media/gladia/documents >/dev/null'"
  }

  Job {
    Name = home.alunduil.com-NAS-MEDIA
    JobDefs = NAS-DEFAULTS
    Client = home.alunduil.com
    FileSet = NAS-MEDIA
    Messages = Standard
    Enabled = yes
    Priority = 7
    Client Run Before Job = "/bin/sh -c 'ls /media/gladia/media >/dev/null'"
  }

  Job {
    Name = home.alunduil.com-NAS-SCANNED
    JobDefs = NAS-DEFAULTS
    Client = home.alunduil.com
    FileSet = NAS-SCANNED
    Messages = Standard
    Enabled = yes
    Priority = 6
    Client Run Before Job = "/bin/sh -c 'ls /media/gladia/scanned >/dev/null'"
  }

  Job {
    Name = giskard.alunduil.com-EVERYTHING
    JobDefs = BACKUP-DEFAULTS
    Client = giskard.alunduil.com
    FileSet = EVERYTHING
    Messages = Standard
    Enabled = yes
    Priority = 10
  }

  Job {
    Name = mycroft.alunduil.com-HOME
    JobDefs = BACKUP-DEFAULTS
    Client = mycroft.alunduil.com
    FileSet = HOME
    Messages = Standard
    Enabled = yes
    Priority = 10
  }

  Job {
    Name = sherlock.alunduil.com-HOME
    JobDefs = BACKUP-DEFAULTS
    Client = sherlock.alunduil.com
    FileSet = HOME
    Messages = Standard
    Enabled = yes
    Priority = 10
  }

  Job {
    Name = sherlock.alunduil.com-MAIL
    JobDefs = BACKUP-DEFAULTS
    Client = sherlock.alunduil.com
    FileSet = MAIL
    Messages = Standard
    Enabled = yes
    Priority = 5
  }

  Job {
    Name = RESTORE
    Type = Restore
    Client = mycroft.alunduil.com
    FileSet = NONE
    Messages = Standard
    Pool = USB-RAID
  }

  JobDefs {
    Name = BACKUP-DEFAULTS
    Type = Backup
    Level = Differential
    Accurate = yes
    Pool = USB-RAID
    Schedule = DAILY
    Max Start Delay = 6 hours
    Max Run Sched Time = 8 hours
    Max Full Interval = 7 days
    Prefer Mounted Volumes = yes
    Cancel Lower Level Duplicates = yes
  }

  JobDefs {
    Name = NAS-DEFAULTS
    Type = Backup
    Level = Differential
    Accurate = yes
    Pool = USB-RAID
    Schedule = WEEKLY
    Max Start Delay = 0
    Max Run Sched Time = 3 days
    Max Full Interval = 1 quarter
    Prefer Mounted Volumes = yes
    Cancel Lower Level Duplicates = yes
    Cancel Queued Duplicates = yes
  }

  Client {
    Name = elijah.laptops.alunduil.com
    Address = localhost
    FD Port = 19102
    Catalog = PostgreSQL
    Password = "998da8a46eaa434e8be8ff7fc877cf94"
  }

  Client {
    Name = giskard.alunduil.com
    Address = giskard.alunduil.com
    Catalog = PostgreSQL
    Password = "998da8a46eaa434e8be8ff7fc877cf94"
  }

  Client {
    Name = home.alunduil.com
    Address = home.alunduil.com
    Catalog = PostgreSQL
    Password = "998da8a46eaa434e8be8ff7fc877cf94"
    File Retention = 1 quarter
  }

  Client {
    Name = mycroft.alunduil.com
    Address = mycroft.alunduil.com
    Catalog = PostgreSQL
    Password = "998da8a46eaa434e8be8ff7fc877cf94"
  }

  Client {
    Name = sherlock.alunduil.com
    Address = sherlock.alunduil.com
    Catalog = PostgreSQL
    Password = "998da8a46eaa434e8be8ff7fc877cf94"
  }

  FileSet {
    Name = EVERYTHING
    Include {
      Options {
        compression = GZIP
        signature = SHA1
        noatime = yes
        checkfilechanges = yes
        aclsupport = yes
        xattrsupport = yes

        onefs = no

        fstype = rootfs
        fstype = btrfs
        fstype = ext4
        fstype = vfat

        wilddir = "*/tmp"
        wilddir = "*/lost+found"
        wilddir = "*/distfiles"
        wilddir = "*/paludis/repositories"
        exclude = yes
      }
      File = /
    }
    Exclude {
      File = /var/lib/docker
    }
  }

  FileSet {
    Name = HOME
    Include {
      Options {
        compression = GZIP
        signature = SHA1
        noatime = yes
        checkfilechanges = yes
        aclsupport = yes
        xattrsupport = yes

        wilddir = "*/tmp"
        wilddir = "*/lost+found"
        exclude = yes
      }
      File = /home
    }
  }

  FileSet {
    Name = MAIL
    Include {
      Options {
        compression = GZIP
        signature = SHA1
        noatime = yes
        checkfilechanges = yes
        aclsupport = yes
        xattrsupport = yes

        wilddir = "*/tmp"
        wilddir = "*/lost+found"
        exclude = yes
      }
      File = /var/spool/mail
    }
  }

  FileSet {
    Name = NAS-DOCUMENTS
    Include {
      Options {
        compression = GZIP
        signature = SHA1
        noatime = yes
        checkfilechanges = yes
        aclsupport = yes
        xattrsupport = yes

        wilddir = "*/lost+found"
        exclude = yes
      }
      File = /media/gladia/documents
    }
  }

  FileSet {
    Name = NAS-MEDIA
    Include {
      Options {
        compression = GZIP
        signature = SHA1
        noatime = yes
        checkfilechanges = yes
        aclsupport = yes
        xattrsupport = yes

        wilddir = "*/lost+found"
        exclude = yes
      }
      File = /media/gladia/media
    }
  }

  FileSet {
    Name = NAS-SCANNED
    Include {
      Options {
        compression = GZIP
        signature = SHA1
        noatime = yes
        checkfilechanges = yes
        aclsupport = yes
        xattrsupport = yes

        wilddir = "*/lost+found"
        exclude = yes
      }
      File = /media/gladia/scanned
    }
  }

  FileSet {
    Name = NONE
  }

  Schedule {
    Name = DAILY
    Run = daily at 23:05
  }

  Schedule {
    Name = WEEKLY
    Run = fri at 8:00
  }

  Schedule {
    Name = NEVER
  }

  Pool {
    Name = USB-RAID
    Maximum Volumes = 880
    Pool Type = Backup
    Storage = USB-RAID-mycroft.alunduil.com
    Maximum Volume Bytes = 2GB
    LabelFormat = "USB-RAID-VOL"
  }

  Storage {
    Name = USB-RAID-mycroft.alunduil.com
    Address = mycroft.alunduil.com
    Password = "ab21917b042b43ae996534179bb32eba"
    Device = USB-RAID
    Media Type = USB-RAID-882e244d128a40ffaa0c85b4f58457f2
    Heartbeat Interval = 30
  }
  '';
}
