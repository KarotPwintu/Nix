#network
{ config, pkgs, inputs, ... }:

{
  imports = [
    #./vpn/
    #./clouds/
    #./tor/
  ];

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Enable networking
  networking.networkmanager.enable = true;
}