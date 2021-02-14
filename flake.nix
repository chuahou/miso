{
  description = "Personal notes with Hakyll";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-20.09";

    # unstable branch used for HLS
    unstable.url = "nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, unstable }:
  let
    system = "x86_64-linux";
    pkgs   = import nixpkgs { inherit system; overlays = [ hlsOverlay ]; };

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

    hakyllOverlay = hsOverrideOverlay (self: super: hpSelf: hpSuper: {
      hakyll =
        super.haskell.lib.appendConfigureFlags
          [ "-f" "watchServer" "-f" "previewServer" ]
          hpSuper.hakyll;
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
        ]);
      })).env;
  };
}
