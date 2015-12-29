{ config, pkgs, ... }:

{
  imports = [];

  networking.firewall.allowedTCPPorts = [ 9103 ];

  services.bacula-dir.enable = true;
  services.bacula-dir.name = config.networking.hostName + "-dir";
  services.bacula-dir.password = "998da8a46eaa434e8be8ff7fc877cf94";

  services.bacula-dir.extraMessagesConfig = ''
  MailCommand = "bsmtp -h localhost -f \"%d <root@${config.networking.hostName}>\" -s \"Bacula—%n %e\" %r"
  OperatorCommand = "bsmtp -h localhost -f \"%d <root@${config.networking.hostName}>\" -s \"Bacula—Intervation needed for %j\" %r"
  mail = root = all, !skipped, !restored
  operator = root = mount
  '';

  services.bacula-dir.extraConfig = ''
  Job {
    Name = FULL-giskard.alunduil.com
    JobDefs = BACKUP-DEFAULTS
    Client = giskard.alunduil.com
    FileSet = EVERYTHING
    Messages = Standard
    Enabled = yes
    Priority = 10
  }

  Job {
    Name = FULL-elijah.laptops.alunduil.com
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
    Name = HOME-mycroft.alunduil.com
    JobDefs = BACKUP-DEFAULTS
    Client = mycroft.alunduil.com
    FileSet = HOME
    Messages = Standard
    Enabled = yes
    Priority = 10
  }

  Job {
    Name = HOME-sherlock.alunduil.com
    JobDefs = BACKUP-DEFAULTS
    Client = sherlock.alunduil.com
    FileSet = HOME
    Messages = Standard
    Enabled = yes
    Priority = 10
  }

  Job {
    Name = HOME-giskard.alunduil.com
    JobDefs = BACKUP-DEFAULTS
    Client = giskard.alunduil.com
    FileSet = HOME
    Messages = Standard
    Enabled = no
    Priority = 10
  }

  Job {
    Name = LAPTOPS-mycroft.alunduil.com
    JobDefs = BACKUP-DEFAULTS
    Client = mycroft.alunduil.com
    FileSet = LAPTOPS
    Messages = Standard
    Enabled = yes
    Priority = 20
  }

  Job {
    Name = RESTORE
    Type = Restore
    Client = mycroft.alunduil.com
    FileSet = NONE
    Messages = Standard
    Pool = USB-RAID1
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

  FileSet {
    Name = LAPTOPS
    Include {
      Options {
        compression = GZIP
	signature = SHA1
	noatime = yes
	checkfilechanges = yes
	aclsupport = yes
	xattrsupport = yes

	wilddir = "/lost+found"
	exclude = yes
      }
      File = /var/backups/laptops
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
    Name = NEVER
  }

  Pool {
    Name = USB-RAID1
    Maximum Volumes = 325
    Pool Type = Backup
    Storage = USB-RAID1-mycroft.alunduil.com
    Maximum Volume Bytes = 2GB
    LabelFormat = "USB-RAID1-VOL"
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
