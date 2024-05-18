{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    p3x-onenote
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
  ];
}
