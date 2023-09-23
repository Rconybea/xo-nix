{ stdenv, fetchgit, cmake, catch2, indentlog }:

stdenv.mkDerivation rec {
  name = "randomgen";

  src = fetchgit {
    url = "https://github.com/rconybea/randomgen";
    rev = "1db6cd4d4a267320502f64f6e941a5990d221ede";
    sha256 = "m2ElrPl2yn0ymsAOREqCAb8I4WdJrdw5LrJv7DyFbwE=";
  };

  buildInputs = [ indentlog
                  cmake
                  catch2
                ];
}
