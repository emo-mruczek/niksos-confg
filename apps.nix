{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    p3x-onenote
    blueman
    mangohud
    vpcs
    #    ciscoPacketTracer8
    heroic
    qemu
    kate
    librewolf
    signal-desktop
    steam
    protonup-qt
    gimp
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
    keepassxc
    openconnect
    subversionClient
    texliveFull
    asciinema
    
#pkgsCross.arm-embedded.buildPackages.gdb
  ];
}
