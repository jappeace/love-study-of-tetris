
with import ./pin-unstable.nix { };

stdenv.mkDerivation {
  name = "love-tetris";
  nativeBuildInputs = [
    pkgs.love_11
  ];
}
