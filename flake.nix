{
  description = "Neovim configuration for TheAltF4Stream as a plugin";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs@{ self, flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        lib = import ./lib { inherit inputs; };
      };

      systems = [ "aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux" ];

      perSystem = { config, self', inputs', pkgs, system, ... }:
        let
          inherit (pkgs) just mkShell writeShellApplication;
          neovim = self.lib.mkNvim { inherit system; };
          neovimRuntimeInputs = self.lib.mkNvimRuntimeInputs { inherit system; };
        in
        {
          devShells = {
            default = mkShell {
              buildInputs = [ just ];
            };
          };

          packages = {
            default = self.lib.mkNvimConfig { inherit system; };

            neovim = writeShellApplication
              {
                runtimeInputs = [ neovim ] ++ neovimRuntimeInputs;
                name = "nvim";
                text = ''
                  ${neovim}/bin/nvim "$@"
                '';
              };
          };
        };
    };
}
