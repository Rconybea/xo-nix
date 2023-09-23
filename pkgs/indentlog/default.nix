{ stdenv, fetchgit, cmake, catch2 }:

stdenv.mkDerivation rec {
  name = "indentlog";

  src = fetchgit {
    url = "https://github.com/rconybea/indentlog";
    rev = "5d6bd7cd405bec3663efbf475c891c3db8be509a";
    sha256 = "3U3O/GO3BRE/LjlnXUYdvgStmyZcSt+lgx60XyIHzqo=";
  };

  buildInputs = [ cmake
                  catch2
                ];
}
