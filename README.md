# thealtf4stream.nvim
Neovim configuration for TheAltF4Stream as a plugin.

[![Test flake](https://github.com/ALT-F4-LLC/thealtf4stream.nvim/actions/workflows/flake.yml/badge.svg)](https://github.com/ALT-F4-LLC/thealtf4stream.nvim/actions/workflows/flake.yml)

## Install

### Neovim (Lua)

- WIP

### Nix

This flake provides a `neovim` output that can be used as a packge on any Nix system. This is a "wrapped" version of Neovim which includes configuration and dependencies (language servers, formatters, etc).

#### Run directly

- Run directly with `nix` run command:

```shell
nix run github:ALT-F4-LLC/thealtf4stream.nvim#neovim
```

#### Add to flake

- Add to your `flake.nix` as a package:

```nix
  inputs = {
    thealtf4stream-nvim.url = "github:ALT-F4-LLC/thealtf4stream.nvim";
  };
```

- Add to your `home-manager` configuration:

```nix
  programs.neovim = {
    enable = true;
    package = inputs.thealtf4stream-nvim.packages.${pkgs.system}.neovim;
  };
```
