{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    p3x-onenote
    blueman
    mangohud
    superTuxKart
    vpcs
    legendary-gl
    heroic
    qemu
    firefox
    kdePackages.kate
    librewolf
    signal-desktop
    protonup-qt
    # gimp
    thunderbird
    libreoffice-qt
    hollywood
    cbonsai
    cmatrix
    kdePackages.dolphin
    obsidian
    osu-lazer-bin
    protonplus
    stlink-tool
    stlink
    # prismlauncher
    keepassxc
    krita
    openconnect
    # texliveFull
    subversionClient
    asciinema
    zathura
    mumble
    vesktop
    qbittorrent-enhanced
    vlc
    scrcpy
    blahaj
    krita
  ];
}
