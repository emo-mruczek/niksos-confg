{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    p3x-onenote
    mangohud
    superTuxKart
    vpcs
    #    ciscoPacketTracer8
    legendary-gl
    heroic
    obs-studio
    qemu
    dynamips
    ubridge
    firefox
    gns3-server
    gns3-gui
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
  ];
}
