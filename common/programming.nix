{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    ninja
    stdmanpages
    sbcl
    smlnj
    astyle
    gnumake
    rocmPackages.llvm.clang-unwrapped
    python3
    # rocmPackages.rocgdb
    jdk
    python311Packages.pip
    rustc
    cargo
    mono
    pyenv
    gdb
    valgrind
    clang-tools
    gperftools
    cmake
    gtest
    gfortran
    just
    gcc-arm-embedded
  ];
}
