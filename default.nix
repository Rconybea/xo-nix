{
  pkgs ? import (fetchTarball {
    # see ./NIX for nix hash instructions

    # 23.05 commit
    #url = "https://github.com/NixOS/nixpkgs/archive/90d94ea32eed9991e2b8c6a761ccd8145935c57c.tar.gz";
    # 23.05, asof 19sep2023:
    url = "https://github.com/NixOS/nixpkgs/archive/5d017a8822e0907fb96f7700a319f9fe2434de02.tar.gz";
  }) {}
}:

with pkgs;

let
  packages = rec {
    randomgen = callPackage ./pkgs/randomgen { indentlog = packages.indentlog; };
    indentlog = callPackage ./pkgs/indentlog {};

    inherit pkgs;
  };
in
packages

