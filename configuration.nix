{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Enabling flakes

  nix.settings.experimental-features = ["nix-command" "flakes"];
  
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  services.flatpak.enable = true;

  networking = {
    hostName = "izolda";
    networkmanager.enable = true;
  };

  environment.systemPackages = with pkgs; [
    (callPackage ./sddm-rose-pine.nix {}).sddm-rose-pine
    #(callPackage ./packettracer.nix {inherit (pkgs) stdenv;}).packettracer
  ];

  services = {
    xserver = {
        layout = "pl";
    xkbVariant = "";
    enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "rose-pine";


    };

  };
};

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
    };

    networking.firewall.trustedInterfaces = [ "virbr0" ];

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
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.felix = {
    isNormalUser = true;
    description = "felix";
    extraGroups = ["networkmanager" "wheel" "ubridge" "libvirtd"];
    packages = with pkgs; [
    ];
  };

  users.groups.ubridge = {};

  security.wrappers.ubridge = {
    source = "/run/current-system/sw/bin/ubridge";
    capabilities = "cap_net_admin,cap_net_raw=ep";
    owner = "root";
    group = "ubridge";
    permissions = "u+rx,g+x";
  };

  nix.settings.trusted-users = ["root" "felix"];

  
  fonts.packages = with pkgs; [
    # font-awesome_5
    #font-awesome_4
    # material-design-icons
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    nerd-fonts.jetbrains-mono

    # (nerdfonts.override {
    #  fonts = [
    #    "JetBrainsMono"
    #  ];
    #})
  ];

  # Allow unfree packages
  nixpkgs.config = {
    permittedInsecurePackages = [
      "electron-25.9.0"
    ];
    allowUnfree = true;
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
   
  services.blueman.enable = true;

 
    systemd.oomd = {
        enable = true;
        enableSystemSlice = true;
        enableRootSlice = true;
        enableUserSlices = true;
    };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
