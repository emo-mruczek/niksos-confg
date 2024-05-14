{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    tree
    gparted
    neovim
    hashcat
    btop
    mesa-demos # demos for 3D
    unzip
    zip
    git
    neofetch
    kitty
    haveged # entropy
    wireshark
    inetutils # somethig for networking
    wl-clipboard # for clipboard
    alejandra
    neovim
    brightnessctl
    pavucontrol
    networkmanagerapplet
    pkg-configUpstream
    openssl_3_1
    lshw
    zip
    unrar
    #plymouth
    dig
    wev
    trashy
    cachix
    # for hyprland
    swww
    waybar
    wofi
    mako
    grim
    slurp

    font-awesome_5
    line-awesome
    lolcat
    jetbrains-mono
  ];
}
