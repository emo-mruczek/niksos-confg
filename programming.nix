{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gcc
    astyle
    julia
    go
    gnumake
    gnat
    rocmPackages.llvm.clang-unwrapped
    python3
    rocmPackages.rocgdb
    nodejs_22
    gnuplot_qt
    ruby
    swiProlog
    jdk
    python311Packages.pip
    rustc
    cargo
    mono
  ];
}
