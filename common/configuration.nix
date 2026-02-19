{pkgs, ...}: {
  # nixpkgs.config.allowBroken = true;

  security = {
    sudo.package = pkgs.sudo.override {withInsults = true;};
    polkit.enable = true;
    pam.services.swaylock = {
      text = ''
        auth include login
      '';
    };
  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    substituters = ["https://hyprland.cachix.org" "https://cache.poz.pet/felix"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "felix:OKE38EUQKENVUouWyfCAJ9++9Fl0ObJMKCYDURm9aUM="];
  };

  programs = {
    steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    #  (callPackage ./sddm-rose-pine.nix {})
    wineWow64Packages.stable
    winetricks
    #(callPackage ./packettracer.nix {inherit (pkgs) stdenv;}).packettracer
  ];

  services = {
    udisks2.enable = true;
    flatpak.enable = true;
    xserver = {
      xkb.layout = "pl";
      xkb.variant = "";
      enable = true;
    };
    # displayManager.sddm = {
    #   enable = true;
    #   wayland.enable = true;
    #   theme = "rose-pine";
    # };
    displayManager.ly = {
      enable = true;
      settings = {
        animation = "gameoflife";
        full_color = true;
        asterisk = "@";
        #battery_id = "BAT0";
        #bigclock = "pl";
        bigclock_seconds = true;
        initial_info_text = ":3";
        clear_password = true;
      };
    };
    playerctld.enable = true;

    blueman.enable = true;
    mullvad-vpn = {
      enable = true;
      package = pkgs.mullvad-vpn;
    };

    # broken
    printing.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  virtualisation = {
    libvirtd = {
      enable = true;
      onBoot = "ignore";
      qemu = {
        package = pkgs.qemu_kvm;
        # ovmf.enable = true;
        runAsRoot = false;
        swtpm.enable = true;
      };
    };
    docker.enable = true;
  };

  networking.firewall = {
    trustedInterfaces = ["virbr0"];

    enable = true;
  };

  console = {
    keyMap = "pl2";
    colors = [
      "191724"
      "eb6f92"
      "31748f"
      "f6c177"
      "9ccfd8"
      "c4a7e7"
      "ebbcba"
      "e0def4"
      "6e6a86"
      "eb6f92"
      "31748f"
      "f6c177"
      "9ccfd8"
      "c4a7e7"
      "ebbcba"
      "e0def4"
    ];
    earlySetup = true;
  };

  users.users.felix = {
    isNormalUser = true;
    description = "felix";
    extraGroups = ["networkmanager" "wheel" "ubridge" "libvirtd"];
    packages = with pkgs; [
    ];
  };

  users.groups.ubridge = {};

  services.openssh.enable = true;
  #  programs.ssh.extraConfig = "
  # Host git.gay
  # HostName        git.gay
  # User            git
  # IdentityFile    ~/.ssh/gitgay
  # KexAlgorithms   ecdh-sha2-nistp521

  # Host github.com
  # HostName        github.com
  # User            git
  # IdentityFile    ~/.ssh/github
  # ";

  security.wrappers.ubridge = {
    source = "/run/current-system/sw/bin/ubridge";
    capabilities = "cap_net_admin,cap_net_raw=ep";
    owner = "root";
    group = "ubridge";
    permissions = "u+rx,g+x";
  };

  nix.settings.trusted-users = ["root" "felix"];

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
      (callPackage ./product-sans.nix {})
    ];

    fontconfig = {
      defaultFonts = {
        sansSerif = ["Google Sans"];
      };
    };
  };

  # Allow unfree packages
  nixpkgs.config = {
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
    allowUnfree = true;
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 7d";
    flake = "/home/felix/niksos-confg/"; #todo
  };

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  systemd.oomd = {
    enable = true;
    enableSystemSlice = true;
    enableRootSlice = true;
    enableUserSlices = true;
  };

  programs.wayland.miracle-wm.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
