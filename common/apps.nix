{
  pkgs,
  inputs,
  nixpkgs-small,
  ...
}: {
  environment.systemPackages = with pkgs; [
    p3x-onenote
    blueman
    mangohud
    superTuxKart
    vpcs
    #    ciscoPacketTracer8
    legendary-gl
    heroic
    qemu
    firefox
    kdePackages.kate
    librewolf
    signal-desktop
    steam
    protonup-qt
    gimp
    thunderbird
    libreoffice-qt
    hollywood
    cbonsai
    cmatrix
    kdePackages.dolphin
    obsidian
    #wineWowPackages.waylandFull
    osu-lazer-bin
    protonplus
    stlink-tool
    stlink
    #gcc-arm-embedded-10
    prismlauncher
    keepassxc
    krita
    openconnect
    #calibre
    teams-for-linux
    texliveFull
    subversionClient
    asciinema
    zathura
    mumble
    vesktop
    qbittorrent-enhanced
    vlc

    #inputs.nixpkgs-small.legacyPackages.x86_64-linux.calibre

    #pkgsCross.arm-embedded.buildPackages.gdb
  ];
}
