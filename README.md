Flake from my NixOS system.

## My Hosts:
- `acer` my notebook
- `droid` nix-on-droid on my Xiaomi Mi9 (cepeus)

## How to
### Run `acer`
Must have flakes active

Clone the repo. `cd` the repository
```console
sudo nixos-rebuild --flake .#acer switch
```
### Run `droid`
Must have nix-on-droid with flake enabled.

Clone the repo. `cd` the repository
```console
sudo nix-on-droid -F . switch
```