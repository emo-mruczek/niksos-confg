{
  config,
  pkgs,
  inputs,
  ...
}: {
  # Enabling flakes

  #temp
  nixpkgs.config.allowBroken = true;
  
  security.sudo.package = pkgs.sudo.override { withInsults = true; };

  security.polkit.enable = true;
    
  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.settings = {
    substituters = ["https://hyprland.cachix.org" "https://cache.poz.pet/felix"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" "felix:OKE38EUQKENVUouWyfCAJ9++9Fl0ObJMKCYDURm9aUM="];
  };

  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  environment.systemPackages = with pkgs; [
    (callPackage ./sddm-rose-pine.nix {})
    wineWowPackages.stable
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
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "rose-pine";
    };
    playerctld.enable = true;
  };

  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };

  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
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

  networking.firewall.trustedInterfaces = ["virbr0"];

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

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    #nssmdns4 = true;
    openFirewall = true;
  };
  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput = {
  #   enable = true;
  #   touchpad.tappingDragLock = false;
  # };

  # Define a user account. Don't forget to set a password with ‘passwd’.
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
      # font-awesome_5
      #font-awesome_4
      # material-design-icons
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      nerd-fonts.jetbrains-mono
      #corefonts
      (callPackage ./product-sans.nix {})

      # (nerdfonts.override {
      #  fonts = [
      #    "JetBrainsMono"
      #  ];
      #})
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

  # List packages installed in system profile. To search, run:
  # $ nix search wget

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

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

  services.blueman.enable = true;

  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;


  programs.wayland.miracle-wm.enable = true;
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
