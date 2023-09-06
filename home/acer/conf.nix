{ config, pkgs, lib, inputs, ... }:
# CONFIGURAÇÕES GERAIS (FORA DO PADRÃO)
let
  system = "x86_64-linux";
in
{
  # STEAM
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  nixpkgs.overlays = [
    (final: prev: {
      steam = prev.steam.override ({ extraPkgs ? pkgs': [], ... }: {
        extraPkgs = pkgs': (extraPkgs pkgs') ++ (with pkgs'; [
          libgdiplus
        ]);
      });
    })
  ];
  # PORTAS
  networking.firewall.allowedTCPPortRanges = [
  # KDE Connect
  { from = 1714; to = 1764; }
  { from = 5000; to = 5000; }
  ];
  networking.firewall.allowedUDPPortRanges = [
    # KDE Connect
    { from = 1714; to = 1764; }
    { from = 5000; to = 5000; }
  ];
   # networking.firewall.enable = false;

  # DNS--
  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];

  # PACOTES
  environment.systemPackages = with pkgs; [
    inputs.nix-software-center.packages.${system}.nix-software-center
    pavucontrol
  ];

  # DESATIVANDO WAYLAND (por problemas no OBS, VLC, ... ;_;)
  services.xserver.displayManager.gdm.wayland = false;

}
