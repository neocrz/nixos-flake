# NixOS - Flake
Flake from my NixOS, Nix, nix-on-droid systems.

## My Hosts:
- `acer` my notebook
- `droid` nix-on-droid on my Xiaomi Mi9 (cepeus)

## How to
### Run `acer` (NixOS)
Must have flakes active.

Clone the repo. `cd` to the repository

`configuration.nix` and `hardware-configuration.nix` in `./host/acer` folder

```console
sudo nixos-rebuild --flake .#acer switch
```
### Run `droid` (nix-on-droid)
Must have nix-on-droid with flakes enabled.

`nix-on-droid.nix` in `./host/droid` folder

Clone the repo. `cd` to the repository
```console
sudo nix-on-droid -F . switch
```

## OBS
### Modules `programs` and `packages`
#### `packages`
loc: commons. packages for all hosts
#### `programs`
loc: host's home. packages for the host