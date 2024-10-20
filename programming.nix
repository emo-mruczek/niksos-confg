{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    sbcl
    smlnj
    astyle
    #    julia
    ghc
    gnumake
    gnat
    rocmPackages.llvm.clang-unwrapped
    python3
    rocmPackages.rocgdb
    gnuplot_qt
    ruby
    swiProlog
    jdk
    python311Packages.pip
    rustc
    cargo
    mono
    pyenv
    qtcreator
    gdb
    valgrind
    flex
    umlet
    nodejs_22
  ];
}
