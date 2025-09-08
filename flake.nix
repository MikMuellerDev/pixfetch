{
  description = "Pixfetch";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, rust-overlay }: {
    packages.x86_64-linux.pixfetch = nixpkgs.legacyPackages.x86_64-linux.rustPlatform.buildRustPackage {
      pname = "pixfetch";
      version = "1.0.0";
      src = ./.;
      cargoHash = "sha256-CA5j5In7pGMbKunKV+lMnCK3tQ5ibR4maf+XK3m15ss=";
    };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.pixfetch;
  };
}
