{ pkgs, ... }:
{ users.users =
    { alunduil =
        { description = "Alex Brandt,,,210.723.0367,alunduil@alunduil.com";
          extraGroups = [
            "docker"
            "fcron"
            "libvirtd"
            "networkmanager"
            "systemd-journal"
            "wheel"
          ];
          isNormalUser = true;
          openssh.authorizedKeys.keys =
            [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC/tAlaJTcXl1JFOEENDv+4MucWw+Kbgmm2HotivfeYNpSofsYfF+u2qmtmPbElPeGn5XP17jOHWzJhFfX+ErCFE2/hxc5+uaMOSthRhEJ2E2KELEYIGMhtJ1Ao96321pa4tWpKO6C0M0v2PoIDk1rBOny9EnHXykAtoSycNUsy3IgCNKTFXwJx0a9C/znHwHiYrxTkkKpAymNnMciDkx99t8wJfOHfblj9z0A6bsDEo/MMNbrStO7AotSo2ir+/p3r3uNDgWI3XnDqhrf/IBKVJs27G8cWwY+1PwwSSEoCoN/6lRFRnG0IS54z/HvhxOOZuQOIECFwKkiSm1mElxWyDnUQaWu4hZAucNIvFFfBusk5oilrYq6ENx4gWgQQVP5a7lt+OhvKyVFLmkqfxx2VzrKa5yWE6lcZhNLDw7duVOmSu86QGLw+mBmYAvDuJfNth9UAOub3iob/NPqe9xGUAHtOyXb9fhubVl6HfMwiAmxy43szQ2UAtQFphwhwsrsGCHlHu1qIzuGFYDfJL0nW6WhN+XGHS5kUqjAeFKpiahauFqbpL7fv7Q1NY3ceLNqaD+aMhWh3zhnVOY3oi5ft+qlSpUacN4+wL25L9GX8NhbSerl8GXPooun+GpAReYuEwHPBs0XZ9xSLdjZ8/wWw2b5e5RMyx74bsd+3CKjyUw== cardno:000500002906"
              "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCYMwLQmEcqEEPLYWaKgmsIH7KeMpDb5+/F+dyA93wUj5l/1IH3ZI8MkHgJWO3o+sQ+BcTY8xXZrjEDpbCPzs9EH7gFWQi2SEWoyLc4STYoWBBHj/jB6CkQAxqmLRTpqPwAEazg8pnypMpyR+85swruo1gzTfvu7NexLe50JSp0r+ic2io9xvc3xTW5epqJvbzvDyBr9U8FRPQti3WrV0Zpc6QSHoFS9GlPAOnMEsQEqFdTt1nMPY32e5ymb9hJLaxpPNNTnLUaXSciMp9y4NUECrLk78+e5ciR37EkCI6/4atVKw5qbKVr7UXN8WXY0KfRzlqLTFf9I0yqaFi70XNn alunduil@elijah"
              "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCseVsNsz+HS2rYEGQc2huIRmShg8gC2CcjfIYPu1/sO+ENehQZEEmnqpIJkhg9BtzffdsHaxKi67h1rRskDnE5yewe4s41NtVT18SAiC7YhPbgKuSo9G4Id7kfmC3QN0ddHDIcf2tE3Sr/JndqtgmTIbOYxAtLSw6MxlwnKwrsTdMuDxuzQ3NUf35l7bowCAzuOazuHs6OChGvZVyCYMMOksjkqCfWTs8GV76TI50ol9N4UYCH37Q4g71HZAo2JyHWPnjI5gREyuBxNcsL7xMgBtxCwIleJcIcZ6XVoQWFvv7s5duOMBj1veyu5lQAG1sTiPAWqvPRPYbPeUZ4fiVF alunduil@elijah"
            ];
          shell = pkgs.zsh;
        };
    };

  services.dd-agent.tags =
    [ "alunduil"
    ];
}
