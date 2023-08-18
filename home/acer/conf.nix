{ config, pkgs, lib, inputs, ... }:
let
  system = "x86_64-linux";
in
{
  # steam
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
  networking.firewall.allowedTCPPortRanges = [
  # KDE Connect
  { from = 1714; to = 1764; }
  ];
  networking.firewall.allowedUDPPortRanges = [
    # KDE Connect
    { from = 1714; to = 1764; }
  ];
   # networking.firewall.enable = false;

  networking.nameservers = [ "8.8.8.8" "8.8.4.4" ];

  environment.systemPackages = with pkgs; [
    inputs.nix-software-center.packages.${system}.nix-software-center
  ];
}