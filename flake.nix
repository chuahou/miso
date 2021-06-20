{
  description = "Personal notes with Hakyll";

  inputs.nixpkgs.url  = "nixpkgs/nixos-21.05";

  outputs = inputs@{ self, nixpkgs, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};

  in rec {
    defaultPackage.${system} = pkgs.haskell.lib.dontHaddock
      (pkgs.haskellPackages.callCabal2nix "miso" ./. {});

    devShell.${system} =
      (pkgs.haskell.lib.overrideCabal defaultPackage.${system} (old: {
        buildTools = (old.buildTools or []) ++ (with pkgs.haskellPackages; [
          cabal-install
          haskell-language-server
          pkgs.python38Packages.livereload

          # for tikz rendering
          pkgs.rubber
          pkgs.poppler_utils

          # stork search
          pkgs.stork
        ]);
      })).env;
  };
}
