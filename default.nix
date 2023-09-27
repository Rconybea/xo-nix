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
    xo_cmake = callPackage ./pkgs/xo-cmake {};
    indentlog = callPackage ./pkgs/indentlog { xo_cmake = packages.xo_cmake; };
    subsys = callPackage ./pkgs/subsys { xo_cmake = packages.xo_cmake; };
    randomgen = callPackage ./pkgs/randomgen { indentlog = packages.indentlog; xo_cmake = packages.xo_cmake; };
    refcnt = callPackage ./pkgs/refcnt { indentlog = packages.indentlog; xo_cmake = packages.xo_cmake; };
    reflect = callPackage ./pkgs/reflect { indentlog = packages.indentlog; refcnt = packages.refcnt; subsys = packages.subsys; xo_cmake = packages.xo_cmake; };

    inherit pkgs;
  };
in
packages
