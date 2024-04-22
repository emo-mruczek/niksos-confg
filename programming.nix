{ pkgs, ... }:

{ 
	environment.systemPackages = with pkgs; [
		gcc
		gnumake
		rocmPackages.llvm.clang-unwrapped
		python3
		rocmPackages.rocgdb
		nodejs_21
		gnuplot_qt
		ruby
		swiProlog
		jdk
		python311Packages.pip
        rustc
        cargo
	];
}
