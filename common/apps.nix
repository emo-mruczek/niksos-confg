{pkgs, inputs, ...}: {
  environment.systemPackages = with pkgs; [
    #inputs.nixpkgs-mindustry.legacyPackages.${pkgs.stdenv.system}.mindustry-wayland
        #    kicad
    # inputs.wii.legacyPackages.${pkgs.stdenv.system}.wiiudownloader
    inputs.sable.legacyPackages.${pkgs.stdenv.system}.sable-desktop
    p3x-onenote
    chromium
    ivpn-ui
    nvidia-container-toolkit
    # nvidia-docker
    # mindustry-wayland
    teamtype
    blueman
    mangohud
    # superTuxKart
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
    prismlauncher
    keepassxc
    krita
    openconnect
    subversionClient
    asciinema
    mumble
    vesktop
    qbittorrent-enhanced
    vlc
    scrcpy
    blahaj
    ente-desktop
    krita
    # lutris
    geckodriver
    gnome-disk-utility
    nautilus
    godot_4
    gurk-rs

    android-tools
  ];
}
