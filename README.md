# NixOS - Flake
Flake from my NixOS, Nix, nix-on-droid systems.

## My Hosts:
- `acer` [NixOS](https://nixos.org/) on my notebook.
- `droid` [nix-on-droid](https://github.com/t184256/nix-on-droid) on my Xiaomi Mi9 (cepheus).

## How to
### Run `acer` (NixOS)
Must have flakes active.

Clone the repo and `cd` to the repository folder.

`configuration.nix` and `hardware-configuration.nix` in `./host/acer` folder

```console
sudo nixos-rebuild --flake .#acer switch
```
### Run `droid` (nix-on-droid)
Must have nix-on-droid with flakes enabled.

Clone the repo and `cd` to the repository folder.

`nix-on-droid.nix` in `./host/droid` folder.

```console
sudo nix-on-droid -F . switch
```

## OBS
### Modules `programs` and `packages`
#### `packages`
loc: commons. packages for all hosts
#### `programs`
loc: host's home. packages for the host