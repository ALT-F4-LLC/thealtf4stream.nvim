{
  description = "Neovim configuration for TheAltF4Stream.";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: let
    forAllSystems = nixpkgs.lib.genAttrs ["aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux"];
  in {
    lib = import ./lib {inputs = self.inputs;};

    packages = forAllSystems (system: {
      default = self.lib.mkVimPlugin {inherit system;};
      neovim = self.lib.mkNeovim {inherit system;};
    });

    apps = forAllSystems (system: {
      nvim = {
        program = "${self.packages.${system}.neovim}/bin/nvim";
        type = "app";
      };
    });

    devShells = forAllSystems (system: {
      default = nixpkgs.legacyPackages.${system}.mkShell {
        buildInputs = [nixpkgs.legacyPackages.${system}.just];
      };
    });

    formatter = forAllSystems (system: nixpkgs.legacyPackages.${system}.alejandra);
  };
}
