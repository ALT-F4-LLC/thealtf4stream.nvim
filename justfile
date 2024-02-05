build profile:
    nix build --json --no-link --print-build-logs ".#{{ profile }}"

cache-build profile cache_name:
    just build "{{ profile }}" | jq -r '.[].outputs | to_entries[].value' | cachix push {{ cache_name }}

cache-inputs cache_name:
    nix flake archive --json \
      | jq -r '.path,(.inputs|to_entries[].value.path)' \
      | cachix push "{{ cache_name }}"

cache-shell cache_name:
    nix develop --profile "dev-profile" -c true
    cachix push "{{ cache_name }}" "dev-profile"

check:
    nix flake check
