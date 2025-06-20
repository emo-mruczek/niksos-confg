{
  config,
  pkgs,
  inputs,
  ...
}: {

  # Enabling flakes

  nix.settings.experimental-features = ["nix-command" "flakes"];

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    (callPackage ./sddm-rose-pine.nix {})
        wineWowPackages.stable
        winetricks


    #(callPackage ./packettracer.nix {inherit (pkgs) stdenv;}).packettracer
  ];

  services = {
    xserver = {
      xkb.layout = "pl";
      xkb.variant = "";
      enable = true;
    };
    displayManager.sddm = {
      #        package = inputs.nixpkgs-small.legacyPackages.${pkgs.system}.kdePackages.sddm;
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


  #   # pyenv flags to be able to install Python
  #   CPPFLAGS = "-I${pkgs.zlib.dev}/include -I${pkgs.libffi.dev}/include -I${pkgs.readline.dev}/include -I${pkgs.bzip2.dev}/include -I${pkgs.openssl.dev}/include";
  #   CXXFLAGS = "-I${pkgs.zlib.dev}/include -I${pkgs.libffi.dev}/include -I${pkgs.readline.dev}/include -I${pkgs.bzip2.dev}/include -I${pkgs.openssl.dev}/include";
  #   CFLAGS = "-I${pkgs.openssl.dev}/include";
  #   LDFLAGS = "-L${pkgs.zlib.out}/lib -L${pkgs.libffi.out}/lib -L${pkgs.readline.out}/lib -L${pkgs.bzip2.out}/lib -L${pkgs.openssl.out}/lib";
  #   CONFIGURE_OPTS = "-with-openssl=${pkgs.openssl.dev}";
  #   PYENV_VIRTUALENV_DISABLE_PROMPT = "1";
  # };
  # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  #boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  #environment.systemPackages = let themes = pkgs.callPackage nixpkgs/pkgs/sddm-rose-pine.nix {}; in [
  #  themes.sddm-rose-pine
  #];

  # Enable the X11 windowing system.

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
        ovmf.enable = true;
        runAsRoot = false;
        swtpm.enable = true;
      };
    };
    docker.enable = true;
  };

  networking.firewall.trustedInterfaces = ["virbr0"];

  #doesnt work with hyprland
  #services.xserver.displayManager.lightdm = {
  #  enable = true;
  #};
  #  services.xserver.displayManager.defaultSession = "hyprland";

  #services.xserver.displayManager.sddm.wayland.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  #  services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11

  # Configure console keymap
  console.keyMap = "pl2";

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    #nssmdns4 = true;
    openFirewall = true;
  };
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

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
      noto-fonts-emoji
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

  services.blueman.enable = true;

  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;

    # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
