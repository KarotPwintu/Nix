#GAMING
{ config, pkgs, inputs, ... }:

{
  config = {
    programs.gamemode.enable = true;

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };  

    environment.systemPackages = with pkgs; [
      bottles
      heroic
      lunar-client
      prismlauncher
    ];
  };  
}