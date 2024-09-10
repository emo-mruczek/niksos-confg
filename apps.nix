{pkgs, ...}: {
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
    kate
    librewolf
    signal-desktop
    steam
    protonup-qt
    gimp
    thunderbird
    libreoffice-qt
    dwarf-fortress
    hollywood
    cbonsai
    cmatrix
    kate
    dolphin
    obsidian
    wineWowPackages.waylandFull
    osu-lazer-bin
    protonplus
    stlink-tool
    stlink
   gcc-arm-embedded-10
   syncthing
   prismlauncher
    logisim-evolution
    kicad-small
    keepassxc


#pkgsCross.arm-embedded.buildPackages.gdb
  ];
}
