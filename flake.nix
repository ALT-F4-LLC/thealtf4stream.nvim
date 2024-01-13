{
  description = "Neovim configuration for TheAltF4Stream as a plugin";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs@{ flake-parts, self, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux" ];

      perSystem = { config, self', inputs', pkgs, system, ... }: {
        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [ just ];
          };
        };

        packages = {
          default = pkgs.vimUtils.buildVimPlugin {
            name = "TheAltF4Stream";
            postInstall = ''
              rm -rf $out/.gitignore
              rm -rf $out/LICENSE
              rm -rf $out/README.md
              rm -rf $out/flake.lock
              rm -rf $out/flake.nix
              rm -rf $out/justfile
              rm -rf $out/.envrc
            '';
            src = ./.;
          };
        };
      };
    };
}
