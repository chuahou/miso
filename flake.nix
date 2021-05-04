{
  description = "Personal notes with Hakyll";

  inputs = {
    nixpkgs.url  = "nixpkgs/nixos-20.09";
    unstable.url = "nixpkgs/nixpkgs-unstable";
  };

  outputs = inputs@{ self, nixpkgs, unstable, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ hlsOverlay ];
    };

    hsOverrideOverlay =
      override:
      self: super: {
        haskellPackages = super.haskellPackages.override (old: {
          overrides = super.lib.composeExtensions
            (old.overrides or (_: _: {}))
            (override self super);
        });
      };

    hlsOverlay = hsOverrideOverlay (self: super: _: _: {
      haskell-language-server =
        unstable.legacyPackages.${super.system}.haskell-language-server;
    });

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
          unstable.legacyPackages.${system}.stork
        ]);
      })).env;
  };
}
