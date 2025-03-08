{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    amdgpu_top
    parted
    flatpak-builder
    tree
    libcap
    zlib
    powertop
    nix-prefetch-github
    #    libsForQt5.qt5.qtquickcontrols2
    qt6.qt5compat
    kdePackages.qt5compat
    #   sbclPackages.qtsvg
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.full
    imv
    efibootmgr
    gparted
    inxi
    hashcat
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
    brightnessctl
    pavucontrol
    networkmanagerapplet
    pkg-configUpstream
    lshw
    zip
    unrar
    cups
    #plymouth
    xdg-desktop-portal-hyprland
    xdg-desktop-portal-wlr
    xdg-desktop-portal
    xdg-utils
    dig
    wev
    trashy
    cachix
    killall
    # for hyprland
    swww
    waybar
    wofi
    #mako
    grim
    grimblast
    satty
    slurp
    swaylock-effects

    font-awesome_5
    line-awesome
    lolcat
    jetbrains-mono

    libffi
    readline
    bzip2
    ncurses
    inotify-tools

    curlpp
  ];
}
