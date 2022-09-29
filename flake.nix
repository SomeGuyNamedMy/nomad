{
  description = "A very basic flake";

  outputs = { self, nixpkgs }:
  let
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {
    defaultPackage.x86_64-linux = pkgs.haskellPackages.mkDerivation {
        pname = "nomad";
        version = "0.0.0";
        src = ./.;
        isLibrary = false;
        isExecutable = true;
        executableHaskellDepends = with pkgs.haskellPackages; [
            base
            dhall
        ];
        license = pkgs.lib.licenses.publicDomain;
    };
    devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = with pkgs; [
            cabal-install
            ghc
            idris2
        ];
    };
  };
}
