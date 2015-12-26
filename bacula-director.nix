{ config, pkgs, ... }:

{
  imports = [];

  services.bacula-dir.enable = true;
  services.bacula-dir.name = config.networking.hostName + "-dir";
  services.bacula-dir.password = "998da8a46eaa434e8be8ff7fc877cf94";

  services.bacula-dir.extraConfig = ''
  Job {
    Name = FULL-giskard.alunduil.com
    JobDefs = BACKUP-DEFAULTS
    Client = CLIENT-giskard.alunduil.com
    FileSet = EVERYTHING
    Messages = Standard
    Enabled = yes
    Priority = 10
  }

  Job {
    Name = HOME-mycroft.alunduil.com
    JobDefs = BACKUP-DEFAULTS
    Client = CLIENT-mycroft.alunduil.com
    FileSet = HOME
    Messages = Standard
    Enabled = yes
    Priority = 10
  }

  Job {
    Name = HOME-sherlock.alunduil.com
    JobDefs = BACKUP-DEFAULTS
    Client = CLIENT-sherlock.alunduil.com
    FileSet = HOME
    Messages = Standard
    Enabled = yes
    Priority = 10
  }

  Job {
    Name = HOME-giskard.alunduil.com
    JobDefs = BACKUP-DEFAULTS
    Client = CLIENT-giskard.alunduil.com
    FileSet = HOME
    Messages = Standard
    Enabled = yes
    Priority = 10
  }

  Job {
    Name = CATALOG-mycroft.alunduil.com
    JobDefs = BACKUP-DEFAULTS
    Client = CLIENT-mycroft.alunduil.com
    FileSet = HOME
    Messages = Standard
    Enabled = yes
    Priority = 20
  }

  JobDefs {
    Name = BACKUP-DEFAULTS
    Type = Backup
    Level = Differential
    Accurate = yes
    Pool = USB-RAID1
    Schedule = DAILY
    Max Start Delay = 6 hours
    Max Run Sched Time = 8 hours
    Max Full Interval = 7 days
    Prefer Mounted Volumes = yes
    Cancel Lower Level Duplicates = yes
  }

  Client {
    Name = CLIENT-giskard.alunduil.com
    Address = giskard.alunduil.com
    Catalog = PostgreSQL
    Password = "998da8a46eaa434e8be8ff7fc877cf94"
  }

  Client {
    Name = CLIENT-mycroft.alunduil.com
    Address = mycroft.alunduil.com
    Catalog = PostgreSQL
    Password = "998da8a46eaa434e8be8ff7fc877cf94"
  }

  Client {
    Name = CLIENT-sherlock.alunduil.com
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
	fstype = ext4

	wilddir = "/tmp"
	wilddir = "/lost+found"
	exclude = yes
      }
      File = /
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

	wilddir = "/tmp"
	wilddir = "/lost+found"
	exclude = yes
      }
      File = /home
    }
  }

  Schedule {
    Name = DAILY
    Run = daily at 23:05
  }

  Pool {
    Name = USB-RAID1
    Maximum Volumes = 15
    Pool Type = Backup
    Storage = USB-RAID1-mycroft.alunduil.com
    Maximum Volume Bytes = 50GB
  }

  Storage {
    Name = USB-RAID1-mycroft.alunduil.com
    Address = mycroft.alunduil.com
    Password = "ab21917b042b43ae996534179bb32eba"
    Device = USB-RAID1
    Media Type = USB-RAID1-882e244d128a40ffaa0c85b4f58457f2
  }
  '';
}
