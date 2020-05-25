{ config, pkgs, ... }: {
  imports = [
    ./hardware-configuration.nix
  ];

  boot = {
    enableContainers = true;
    loader = {
      efi = {
        canTouchEfiVariables = false;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        version = 2;
        device = "/dev/sdb";
        configurationLimit = 100;
      };
      systemd-boot = {
        enable = true;
        configurationLimit = null;
      };
    };
  };

  services = {
    sshd = {
      enable = true;
    };
  };

  networking = {
    hostName = "rambaud";
    enableIPv6 = true;
  };

  fonts = {
    enableDefaultFonts = true;
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  environment = {
    shells = [
      pkgs.zsh
    ];
    systemPackages = [
      pkgs.vim
      pkgs.mkpasswd
      pkgs.git
    ];
  };

  programs = {
    vim = {
      defaultEditor = true;
    };
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestions = {
        enable = true;
      };
      ohMyZsh = {
        enable = true;
        package = pkgs.oh-my-zsh;
        cacheDir = "\$HOME/.cache/oh-my-zsh";
        theme = "af-magic";
      };
      setOptions = [
        "HIST_IGNORE_DUPS"
        "SHARE_HISTORY"
        "HIST_FCNTL_LOCK"
      ];
      syntaxHighlighting = {
        enable = true;
      };
    };
  };

  time = {
    timeZone = "Etc/UTC";
    hardwareClockInLocalTime = false;
  };

  users = {
    enforceIdUniqueness = true;
    mutableUsers = true;
    users = {
      darren = {
        initialHashedPassword = "$6$4CanI/KMP$j6jb8n1njLqqVPzsi5OgJgKa/L62UHSUr/o4.Q6qEXrJq7N3fFyi36kOAn5kG6cnlyvv.bsG7Kug/gaV8j2Lx.";
        isNormalUser = true;
        description = "King of the Austonians; Protector of the Silicon Hills; King of the Great Cluster Sea; Breaker of Monoliths; The Refactorer";
        group = "users";
        extraGroups = [
          "wheel"
          "docker"
        ];
        shell = pkgs.zsh;
        openssh.authorizedKeys.keys = [
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1tyVJGEVwUniarTymeAKm1q3Sr6JJXG0UPzUKzhW6zBdkGfPWFmm9SXLomBrUWYbSjEFtwoZ32GfMQnVcKiyfYWNyXzesCc1JP1/33ay0I9SnGTv2W9llkz5ur/zuqHSX4dAiyUsVc1XmSOo7k9+AdAqT/TYY/TZL/5jYsqIYF6RL3KITm49kMCCJkOqODAqUTBosgah0XSlkU9mlk8wZpsgPWmffNbMdyu9WN5p64AR+75u8CACzLAZsw6HM5lf1KcpH0sgRPUImAkqW8ywx6pROcwwVGHY5uBxehozexl1UPpSMTYTlA1MomVIL0cWvwgSQ+lg59ZG7VGJqRdj7dK0uZn/wJ3lH4jiA3L5I1viv7fpTaEZdWq9Rj1wyIB2EhMoiA33wJooYgIyeBhldGsKFEXz2DLCdOZl9BIGUak7oa7bD0Q7qsoaijmaqjuM+oSraGl7zcbVELyr0o+bpDz5evD7jWxtvLq45TEPezAxo0wYUF+byLzHXVviAAVHh/yQvXi+GNYO6Ut65oZt+VWog4vh5UEogudv93csByPPbGftRdyT+W6g7wyhfq3EngwudqyOMnbANDI6LHbN2dIqT8zEwjUz6YJAjlqHR3ZpYwzs+jfmnUSc8ODI1uoOpXb1vTqHsMzWhsejfbVB9LAUuAbPJsyCnU1zLhrqCGQ== xyzst@users.noreply.github.com"
        ]; 
      };
    };
    motd = 
      ''
                                                               
                                 ,--.                      ,--. 
        ,--.--. ,--,--.,--,--,--.|  |-.  ,--,--.,--.,--. ,-|  | 
        |  .--''' ,-.  ||        || .-. ''' ,-.  ||  ||  |' .-. | 
        |  |   \ '-'  ||  |  |  || `-' |\ '-'  |'  '''  '\ `-' | 
        `--'    `--`--'`--`--`--' `---'  `--`--' `----'  `---'  
                                                                
      '';
  };

  virtualisation = {
    docker = {
      enable = true;
      enableNvidia = false;
      enableOnBoot = true;
      liveRestore = true;
      logDriver = "journald";     
    };
  };
}
