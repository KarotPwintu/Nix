# ██░ ██  ▒█████   ███▄ ▄███▓▓█████ #
#▓██░ ██▒▒██▒  ██▒▓██▒▀█▀ ██▒▓█   ▀ #
#▒██▀▀██░▒██░  ██▒▓██    ▓██░▒███   #
#░▓█ ░██ ▒██   ██░▒██    ▒██ ▒▓█  ▄ #
#░▓█▒░██▓░ ████▓▒░▒██▒   ░██▒░▒████▒#
# ▒ ░░▒░▒░ ▒░▒░▒░ ░ ▒░   ░  ░░░ ▒░ ░#
# ▒ ░▒░ ░  ░ ▒ ▒░ ░  ░      ░ ░ ░  ░#
# ░  ░░ ░░ ░ ░ ▒  ░      ░      ░   #
# ░  ░  ░    ░ ░         ░      ░  ░#
#                                   #
{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    #inputs.nix-doom-emacs.hmModule 
    ../../env/Hyprland/configuration.nix
    ../../env/shell/.default.nix
    ../../web/browser.nix
  ];

  programs.home-manager.enable = true;

  home = {
    username = "emile";
    homeDirectory = "/home/emile";
  };

  home.stateVersion = "24.05";
}