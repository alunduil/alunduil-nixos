{ ... }:
{
  services.smartd = {
    defaults.autodetected = "-a -o on -s (S/../.././02|L/../../7/04) -T permissive";
    enable = true;
    notifications.mail.enable = true;
  };
}
