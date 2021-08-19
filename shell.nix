# A nix-shell expression with the collection of build inputs for the
# various board expressions. Can be helpful when debugging LiteX.

{ pkgs ? (import <nixpkgs> {}), enableVivado ? false }:

with pkgs;

let
  litexPkgs = import ./pkgs { inherit pkgs; };

in
  stdenv.mkDerivation {
    name = "litex-shell";
    buildInputs = with litexPkgs; [
      migen litex openocd
      litex-boards
      litedram
      liteeth
      liteiclink
      litescope
      litespi
      litepcie
      litehyperbus
      pythondata-cpu-vexriscv pkgsCross.riscv64.buildPackages.gcc gnumake

      # For simulation
      pythondata-misc-tapcfg libevent json_c verilator

      # For ECP5 bitstream builds
      yosys nextpnr icestorm

      # For executing the maintenance scripts of this repository
      python3 python3Packages.toml
    ] ++ (if enableVivado then [(pkgs.callPackage ./pkgs/vivado {})] else []);
  }
