{
  pkgs,
  config,
  ...
}: {
  environment.systemPackages = with pkgs; [
    p3x-onenote
    blueman
    mangohud
    vpcs
    #    ciscoPacketTracer8
    heroic
    qemu
    #  kate
    librewolf
    signal-desktop
    steam
    protonup-qt
    gimp
    libreoffice-qt
    hollywood
    cbonsai
    cmatrix
    # kate
    # dolphin
    obsidian
    wineWowPackages.waylandFull
    osu-lazer-bin
    protonplus
    stlink-tool
    stlink
    syncthing
    prismlauncher
    keepassxc
    openconnect
    subversionClient
    texliveFull
    asciinema
    wayvnc
    scrcpy
    blahaj
    vesktop
    #(pkgs.vesktop.overrideAttrs (old: {
    #   postFixup = lib.concatStrings [
    #       old.postFixup
    #     ''
    #     wrapProgram $out/bin/vesktop \
    #        --add-flags "--ozone-platform=wayland \
    #            --enable-zero-copy \
    #             --use-gl=angle \
    #             --use-vulkan \
    #            --enable-oop-rasterization \
    #            --enable-raw-draw \
    #        --enable-gpu-rasterization \
    #            --enable-gpu-compositing \
    #            --enable-native-gpu-memory-buffers \
    #           --enable-accelerated-2d-canvas \
    #            --enable-accelerated-video-decode \
    #            --enable-accelerated-mjpeg-decode \
    #            --disable-gpu-vsync \
    #           --enable-features=Vulkan,VulkanFromANGLE,DefaultANGLEVulkan,VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport"
    #''
    #     ];
    #        }))
    #pkgsCross.arm-embedded.buildPackages.gdb
  ];
}
