{
  description = "Neovim configuration for TheAltF4Stream as a plugin";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = inputs@{ self, flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      flake = {
        lib = import ./lib { inherit inputs; };
      };

      systems = [ "aarch64-darwin" "aarch64-linux" "x86_64-darwin" "x86_64-linux" ];

      perSystem = { config, self', inputs', pkgs, system, ... }: {
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

          neovim = (self.lib.mkNvim { inherit system; }).overrideAttrs (oldAttrs: {
            nativeBuildInputs = with pkgs; oldAttrs.nativeBuildInputs ++ [
              cuelsp
              gopls
              haskell-language-server
              jsonnet-language-server
              lua-language-server
              nil
              nodePackages."bash-language-server"
              nodePackages."diagnostic-languageserver"
              nodePackages."dockerfile-language-server-nodejs"
              nodePackages."pyright"
              nodePackages."typescript"
              nodePackages."typescript-language-server"
              nodePackages."vscode-langservers-extracted"
              nodePackages."yaml-language-server"
              ocaml-ng.ocamlPackages_5_1.ocaml-lsp
              ocaml-ng.ocamlPackages_5_1.ocamlformat
              omnisharp-roslyn
              rust-analyzer
              terraform-ls

              # formatters
              nixpkgs-fmt
              gofumpt
              golines
              python310Packages.black
              rustfmt
              terraform
            ];
          });
        };
      };
    };
}
