{
  description = "ipxe build environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = [
            pkgs.zsh
 	          pkgs.gcc
            pkgs.gnumake
	          pkgs.binutils
            pkgs.xz
	          pkgs.git
          ];
	
          shellHook = ''
            exec zsh
	  '';
        };
      }
    );
}
