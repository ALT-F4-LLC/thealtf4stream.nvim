{inputs}: let
  inherit (inputs.nixpkgs) legacyPackages;
in rec {
  mkVimPlugin = {system}: let
    inherit (pkgs) vimUtils;
    inherit (vimUtils) buildVimPlugin;
    pkgs = legacyPackages.${system};
  in
    buildVimPlugin {
      buildInputs = with pkgs; [doppler nodejs];

      dependencies = with pkgs.vimPlugins; [
        # theme
        tokyonight-nvim

        # languages
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
        rust-tools-nvim

        # navigation
        plenary-nvim
        telescope-nvim

        # code assist
        avante-nvim
        copilot-lua
        dressing-nvim
        nui-nvim

        # extras
        comment-nvim
        gitsigns-nvim
        lualine-nvim
        noice-nvim
        nvim-colorizer-lua
        nvim-notify
        nvim-treesitter-context
        render-markdown-nvim
      ];

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

      nvimSkipModules = [
        "init"
      ];
    };

  mkNeovimPlugins = {system}: let
    inherit (pkgs) vimPlugins;
    pkgs = legacyPackages.${system};
    thealtf4stream-nvim = mkVimPlugin {inherit system;};
  in
    with vimPlugins; [
      # languages
      vim-just
      zig-vim

      # floaterm
      vim-floaterm

      # extras
      image-nvim
      nvim-colorizer-lua
      nvim-web-devicons
      rainbow-delimiters-nvim
      trouble-nvim

      # configuration
      thealtf4stream-nvim
    ];

  mkExtraPackages = {system}: let
    inherit (pkgs) nodePackages python3Packages;
    pkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  in [
    # language servers
    nodePackages.bash-language-server
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages.yaml-language-server
    pkgs.cuelsp
    pkgs.dhall-lsp-server
    pkgs.gopls
    pkgs.jsonnet-language-server
    pkgs.lua-language-server
    pkgs.nil
    pkgs.nls
    pkgs.postgres-lsp
    pkgs.pyright
    pkgs.terraform-ls

    # formatters
    pkgs.alejandra
    pkgs.gofumpt
    pkgs.golines
    pkgs.terraform
    python3Packages.black

    # others
    pkgs.imagemagick
  ];

  mkExtraConfig = ''
    lua << EOF
      require 'TheAltF4Stream'.init()
    EOF
  '';

  mkNeovim = {system}: let
    inherit (pkgs) lib neovim;
    extraPackages = mkExtraPackages {inherit system;};
    pkgs = legacyPackages.${system};
    start = mkNeovimPlugins {inherit system;};
  in
    neovim.override {
      configure = {
        customRC = mkExtraConfig;
        packages.main = {inherit start;};
      };
      extraMakeWrapperArgs = ''--suffix PATH : "${lib.makeBinPath extraPackages}"'';
      withNodeJs = true;
      withPython3 = true;
      withRuby = true;
    };

  mkHomeManager = {system}: let
    extraConfig = mkExtraConfig;
    extraPackages = mkExtraPackages {inherit system;};
    plugins = mkNeovimPlugins {inherit system;};
  in {
    inherit extraConfig extraPackages plugins;
    defaultEditor = true;
    enable = true;
    extraLuaPackages = ps: [ps.magick];
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;
  };
}
