# thealtf4stream.nvim
Neovim configuration for TheAltF4Stream as a plugin.

[![Test flake](https://github.com/ALT-F4-LLC/thealtf4stream.nvim/actions/workflows/flake.yml/badge.svg)](https://github.com/ALT-F4-LLC/thealtf4stream.nvim/actions/workflows/flake.yml)

![Preview](https://github.com/ALT-F4-LLC/thealtf4stream.nvim/blob/main/lib/preview.webp)

## Install

### Neovim

> [!WARNING]
> By default, this setup was designed for Nix and needs a stable example Lua configuration.

- WIP

### Nix

This flake provides a `neovim` derivation that can be used as a packge on any Nix supported system. This is a "wrapped" variant of Neovim which includes configuration and dependencies (language servers, formatters, etc).

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
programs.neovim = {
  enable = true;
  package = inputs.thealtf4stream-nvim.packages.${pkgs.system}.neovim;
};
```
