{pkgs, inputs, ...}: {
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

  # docker fucking internet
  #   boot.kernel.sysctl."net.ipv4.ip_forward" = 1;
  # boot.kernel.sysctl."net.ipv6.ip_forward" = 1;
  # virtualisation.oci-containers.backend = "docker";
# Next enable the NVIDIA Container Toolkit so Docker can see the GPU.
# Docker automatically integrates with the NVIDIA GPU via the Container Device Interface (CDI).
 hardware.nvidia-container-toolkit = {
    enable = true;
    mount-nvidia-executables = false;
    

  };

  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-substituters = [ "https://cache.poz.pet/felix"];
    trusted-public-keys = ["felix:ntsaTSEjCfMQm+f8yCCW3Fju1/6sfV2R9Z1ch8lukHg="];
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
    (callPackage ./packages/foldit.nix {})
    wineWow64Packages.stable
    winetricks
    #(callPackage ./packettracer.nix {inherit (pkgs) stdenv;}).packettracer
  ];

  nixpkgs.overlays = [ inputs.waybar.overlays.waybar ];

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
        bigclock = "en";
        bigclock_seconds = true;
        initial_info_text = ":3";
        clear_password = true;
      };
    };
    playerctld.enable = true;

    blueman.enable = true;
   
    # broken
    printing = { 
      enable = true;
      drivers = with pkgs; [ foo2zjs ];
    };

    ivpn.enable = true;

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
    # docker = {
    #   enable = true;
    #   # daemon.settings.features.cdi = true;
    #   # daemon.settings.cdi-spec-dirs = ["/run/cdi"];
    # };
  };

  networking.firewall = {
    trustedInterfaces = ["virbr0"];
    allowedTCPPorts = [53];

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
    extraGroups = ["networkmanager" "wheel" "ubridge" "libvirtd" "dialout" "docker" "adbusers"];
  };

  users.groups.ubridge = {};

  #services.openssh.enable = true;
   programs.ssh = { 
    startAgent = true;
    extraConfig = ''
  Host github.com
  HostName        github.com
  User            git
  IdentitiesOnly  yes
  IdentityFile    ${pkgs.writeText "github.pub" "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIWiFYL2ktfPtIpkFrhGgUcgZuDFzJWs0YPbSbZaEcRm krokcia1@gmail.com"}

  Host gitgay
  HostName        git.gay
  User            emo-mruczek
  IdentitiesOnly  yes
  IdentityFile    ${pkgs.writeText "gitgay.pub" "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC/b5OU5Q+5zlc50Qrl1B3N91Ub7XvQ+bSeHFOAlWUGP krokcia1@gmail.com"}

 Host pozpet
  HostName        poz.pet
  User            emo-mruczek
  IdentitiesOnly  yes
  IdentityFile    ${pkgs.writeText "pozpet.pub" "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDp4XgaI4dwwf5tpCLAR2XuKCCv/zNOBGSwKUrPq1U6E felix@izolda"}

 Host tramwaj-git
  HostName        git.tramwaj.ovh
  User            emo-mruczek
  IdentitiesOnly  yes
  IdentityFile    ${pkgs.writeText "tramwaj-git.pub" "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIP8mF7OM9clIPjxEomG4+2TgzkW5xF0vvlG/ia3tnuD3 felix@izolda"}
  '';
  };


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

  #programs.wayland.miracle-wm.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
