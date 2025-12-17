{
  description = "proxytool";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (
    system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      packages.default = pkgs.buildGoModule {
        pname = "proxytool";
        version = "dirty";
        src = self;
        vendorHash = "sha256-b653/iOkR6JZ2zXSpGoA5rmhWHcPLw3Iy8yWo2Z8jhw=";
        env.CGO_ENABLED = 0;
        ldflags = [ "-s" "-w" ];
        meta = {
          description = "Lightweight utility for wrapping a SOCKSv5 proxy with an HTTP(S) proxy";
          homepage = "https://github.com/klustic/proxytool";
        };
      };
    }
  );
}
