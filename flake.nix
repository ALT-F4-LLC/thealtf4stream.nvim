{
  description = "Neovim configuration for TheAltF4Stream as a plugin";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs@{ flake-parts, self, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux" ];

      perSystem = { config, self', inputs', pkgs, system, ... }: {
        packages = {
          thealtf4stream-nvim = pkgs.vimUtils.buildVimPlugin {
            name = "TheAltF4Stream";
            src = ./lua;
          };
        };
      };
    };
}
