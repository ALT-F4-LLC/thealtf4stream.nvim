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

  mkNvimPlugins = { system }:
    let
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      thealtf4stream-nvim = mkNvimConfig { inherit system; };
    in
    with pkgs; [
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

  mkNvimRuntimeInputs = { system }:
    let
      pkgs = (import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
      });
    in
    with pkgs; [
      # language servers
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

  mkNvimExec = { system }:
    let
      neovim = mkNvimFull { inherit system; };
      neovimRuntimeInputs = mkNvimRuntimeInputs { inherit system; };
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    pkgs.writeShellApplication
      {
        runtimeInputs = [ neovim ] ++ neovimRuntimeInputs;
        name = "nvim";
        text = ''
          ${neovim}/bin/nvim "$@"
        '';
      };

  mkNvimFull = { system }:
    let
      pkgs = inputs.nixpkgs.legacyPackages.${system};
    in
    pkgs.neovim.override {
      configure = {
        customRC = ''
          lua << EOF
            require 'TheAltF4Stream'.init()
          EOF
        '';
        packages.main =
          let
            plugins = mkNvimPlugins { inherit system; };
          in
          {
            start = plugins;
          };
      };

      withNodeJs = true;
      withPython3 = true;
      withRuby = true;
    };

  mkNvim = { system }:
    let
      neovim = mkNvimFull { inherit system; };
      neovimExec = mkNvimExec { inherit system; };
    in
    neovim.overrideAttrs (oldAttrs: {
      installPhase = ''
        mkdir -p $out/bin
        cp ${neovimExec}/bin/nvim $out/bin/nvim
      '';
    });
}

