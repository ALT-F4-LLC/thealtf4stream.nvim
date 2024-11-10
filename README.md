# thealtf4stream.nvim
Neovim configuration and examples for TheAltF4Stream.

[![Test flake](https://github.com/ALT-F4-LLC/thealtf4stream.nvim/actions/workflows/flake.yaml/badge.svg)](https://github.com/ALT-F4-LLC/thealtf4stream.nvim/actions/workflows/flake.yaml)

![Preview](https://github.com/ALT-F4-LLC/thealtf4stream.nvim/blob/main/lib/preview.webp)

## Contents

- [Dependencies](#dependencies)
    - [Language Servers](#language-servers)
    - [Formatters](#formatters)
- [Plugins](#plugins)
    - [Environment](#environment)
    - [Languages](#languages)
    - [Navigation](#navigation)
    - [Theme](#theme)
    - [Terminal](#terminal)
    - [Completion](#completion)
    - [Extras](#extras)
- [Setup](#setup)
    - [Lua](#lua)
    - [Nix](#nix)

## Dependencies

### Language Servers

These language servers provide support for various programming languages, offering features like auto-completion, go-to definition, and real-time diagnostics.

| Dependency Name                     | Dependency URL                                                                                         |
|-------------------------------------|--------------------------------------------------------------------------------------------------------|
| `bash-language-server`              | [bash-language-server](https://github.com/bash-lsp/bash-language-server)                               |
| `diagnostic-languageserver`         | [diagnostic-languageserver](https://github.com/iamcco/diagnostic-languageserver)                       |
| `dockerfile-language-server-nodejs` | [dockerfile-language-server-nodejs](https://github.com/rcjsuen/dockerfile-language-server-nodejs)      |
| `gopls`                             | [gopls](https://github.com/golang/tools/tree/master/gopls)                                             |
| `jsonnet-language-server`           | [jsonnet-language-server](https://github.com/jdbaldry/jsonnet-language-server)                         |
| `lua-language-server`               | [lua-language-server](https://github.com/sumneko/lua-language-server)                                  |
| `nil`                               | [nil](https://github.com/oxalica/nil)                              |
| `pyright`                           | [pyright](https://github.com/microsoft/pyright)                                                        |
| `rust-analyzer`                     | [rust-analyzer](https://github.com/rust-analyzer/rust-analyzer)                                        |
| `vscode-langservers-extracted`      | [vscode-langservers-extracted](https://github.com/hrsh7th/vscode-langservers-extracted)                |
| `yaml-language-server`              | [yaml-language-server](https://github.com/redhat-developer/yaml-language-server)                       |

### Formatters

These formatters ensure code consistency and style compliance by automatically formatting source code according to defined rules.

| Dependency Name  | Dependency URL                                             |
|------------------|------------------------------------------------------------|
| `alejandra`      | [alejandra](https://github.com/kamadorueda/alejandra)        |
| `black`          | [black](https://github.com/psf/black)                      |
| `gofumpt`        | [gofumpt](https://github.com/mvdan/gofumpt)                |
| `golines`        | [golines](https://github.com/segmentio/golines)            |
| `rustfmt`        | [rustfmt](https://github.com/rust-lang/rustfmt)            |

## Plugins

### Environment

Environment plugin (this repo) which provides an "out-of-the-box" solution configuring all dependencies and plugins mentioned below.

> [!IMPORTANT]
> This plugin must be loaded last after all others in your configuration (see install section).

| Plugin Name                        | Plugin URL                                                               |
|------------------------------------|--------------------------------------------------------------------------|
| `thealtf4stream.nvim`              | [thealtf4stream.nvim](https://github.com/ALT-F4-LLC/thealtf4stream.nvim) |

### Language(s)

Language plugins that provide enhancements such as syntax highlighting, LSP configurations, and additional tools for programming languages.

| Plugin Name                        | Plugin URL                                                            |
|------------------------------------|-----------------------------------------------------------------------|
| `nvim-lspconfig`                   | [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)            |
| `nvim-treesitter.withAllGrammars`  | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| `rust-tools-nvim`                  | [rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim)        |
| `vim-just`                         | [vim-just](https://github.com/NoahTheDuke/vim-just)                   |
| `vim-nickel`                       | [vim-nickel](https://github.com/nickel-lang/vim-nickel)               |
| `zig-vim`                          | [zig.vim](https://github.com/ziglang/zig.vim)                         |

### Navigation

Navigation plugins provide an interactive, highly extendable fuzzy finder for Neovim.

| Plugin Name       | Plugin URL                                                         |
|-------------------|--------------------------------------------------------------------|
| `plenary-nvim`    | [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)           |
| `telescope-nvim`  | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) |

### Theme

Theme plugins enhance the visual appearance of the editor with different color schemes.

| Plugin Name       | Plugin URL                                                  |
|-------------------|-------------------------------------------------------------|
| `tokyonight-nvim` | [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) |

### Terminal

Terminal plugins provide floating terminal windows within the editor.

| Plugin Name       | Plugin URL                                                  |
|-------------------|-------------------------------------------------------------|
| `vim-floaterm`    | [vim-floaterm](https://github.com/voldikss/vim-floaterm)    |

### Completion

Completion plugins that provide LLM driven support for various languages and situations.

| Plugin Name        | Plugin URL                                                  |
|--------------------|-------------------------------------------------------------|
| `CopilotChat-nvim` | [CopilotChat.nvim](https://github.com/github/copilot.vim)   |

### Extras

Extra plugins that provide functionalities such as Git integration, status lines, notifications, commenting, and more.

| Plugin Name                   | Plugin URL                                                                            |
|-------------------------------|---------------------------------------------------------------------------------------|
| `comment-nvim`                | [comment.nvim](https://github.com/numToStr/Comment.nvim)                              |
| `copilot-lua`                 | [copilot.lua](https://github.com/zbirenbaum/copilot.lua)                              |
| `gitsigns-nvim`               | [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)                           |
| `lualine-nvim`                | [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)                          |
| `noice-nvim`                  | [noice.nvim](https://github.com/folke/noice.nvim)                                     |
| `nui-nvim`                    | [nui.nvim](https://github.com/MunifTanjim/nui.nvim)                                   |
| `nvim-colorizer-lua`          | [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua)                  |
| `nvim-notify`                 | [nvim-notify](https://github.com/rcarriga/nvim-notify)                                |
| `nvim-treesitter-context`     | [nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context) |
| `nvim-web-devicons`           | [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons)                  |
| `rainbow-delimiters-nvim`     | [rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)         |
| `trouble-nvim`                | [trouble.nvim](https://github.com/folke/trouble.nvim)                                 |

## Setup

There are two methods for setting up the development environment in Neovim: 

- pure Lua implementation
- reproducible Nix implementation

### Lua

Example of how to setup Neovim with Lua based solutions like Packer, etc.

#### Example

```lua
-- init.lua or plugins.lua

-- Ensure packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
  end
end

ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Package manager

  -- Environment
  use 'ALT-F4-LLC/thealtf4stream.nvim'

  -- Languages
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'simrat39/rust-tools.nvim'
  use 'NoahTheDuke/vim-just'
  use 'nickel-lang/vim-nickel'
  use 'ziglang/zig.vim'

  -- Navigation
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- Theme
  use 'folke/tokyonight.nvim'

  -- Terminal
  use 'voldikss/vim-floaterm'

  -- Completion
  use 'github/copilot.vim'

  -- Extras
  use 'numToStr/Comment.nvim'
  use 'zbirenbaum/copilot.lua'
  use 'lewis6991/gitsigns.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'folke/noice.nvim'
  use 'MunifTanjim/nui.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'rcarriga/nvim-notify'
  use 'nvim-treesitter/nvim-treesitter-context'
  use 'kyazdani42/nvim-web-devicons'
  use 'HiPhish/rainbow-delimiters.nvim'
  use 'folke/trouble.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
```

### Nix

This repo provides a `neovim` derivation that can be used as a packge on any Nix supported system. This is a "wrapped" variant of Neovim which includes configuration and dependencies (language servers, formatters, etc).

> [!NOTE]
> The `neovim` derivation provides an identical editor expierence on any `nix` supported host.

#### Run in shell

- Run `neovim` directly with:

```shell
$ nix run github:ALT-F4-LLC/thealtf4stream.nvim#neovim
```

- Run `neovim` in new shell with:

```shell
$ nix shell github:ALT-F4-LLC/thealtf4stream.nvim#neovim
$ neovim
```

#### Add to flake

- Add to `flake.nix` as an input:

```nix
inputs = {
  thealtf4stream-nvim.url = "github:ALT-F4-LLC/thealtf4stream.nvim";
};
```

- (option a): Add to `environment.systemPackages` configuration:

```nix
environment.systemPackages = [
  inputs.thealtf4stream-nvim.packages.${pkgs.system}.neovim
];
```

- (option b): Add to `home-manager` configuration:

```nix
programs.neovim = inputs.thealtf4stream-nvim.lib.mkHomeManager {
  system = pkgs.system;
};
```
