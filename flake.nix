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
          neovim = self.lib.mkNvim { inherit system; };
          neovimRuntimeInputs = self.lib.mkNvimRuntimeInputs { inherit system; };
        in
        {
          _module.args.pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };

          devShells = {
            default = pkgs.mkShell {
              buildInputs = with pkgs; [ just ];
            };
          };

          packages = {
            default = self.lib.mkNvimConfig { inherit system; };

            neovim = pkgs.writeShellApplication
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
