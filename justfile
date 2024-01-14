build profile="default":
    nix build --json --no-link --print-build-logs ".#{{ profile }}"
