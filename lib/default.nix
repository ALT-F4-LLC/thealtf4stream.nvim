{ inputs }:

rec {
  mkNvimConfig = { system }:
    let
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    pkgs.vimUtils.buildVimPlugin {
      name = "TheAltF4Stream";
      postInstall = ''
        rm -rf $out/.envrc
        rm -rf $out/.gitignore
        rm -rf $out/LICENSE
        rm -rf $out/README.md
        rm -rf $out/flake.lock
        rm -rf $out/flake.nix
        rm -rf $out/justfile
        rm -rf $out/lib
      '';
      src = ../.;
    };

  mkNvim = { system }:
    let
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      thealtf4stream-nvim = mkNvimConfig { inherit system; };
    in
    pkgs.neovim.override {
      configure = {
        customRC = ''
          lua << EOF
            require 'TheAltF4Stream'.init()
          EOF
        '';
        packages.main = {
          start = with pkgs; [
            # languages
            vimPlugins.nvim-lspconfig
            vimPlugins.nvim-treesitter.withAllGrammars
            vimPlugins.rust-tools-nvim
            vimPlugins.vim-just

            # telescope
            vimPlugins.plenary-nvim
            vimPlugins.telescope-nvim

            # theme
            vimPlugins.oxocarbon-nvim

            # floaterm
            vimPlugins.vim-floaterm

            # extras
            vimPlugins.ChatGPT-nvim
            vimPlugins.copilot-lua
            vimPlugins.gitsigns-nvim
            vimPlugins.lualine-nvim
            vimPlugins.nerdcommenter
            vimPlugins.nui-nvim
            vimPlugins.nvim-colorizer-lua
            vimPlugins.nvim-notify
            vimPlugins.nvim-treesitter-context
            vimPlugins.nvim-web-devicons
            vimPlugins.omnisharp-extended-lsp-nvim
            vimPlugins.rainbow-delimiters-nvim

            # configuration
            thealtf4stream-nvim
          ];
        };
      };

      withNodeJs = true;
      withPython3 = true;
      withRuby = true;
    };
}
