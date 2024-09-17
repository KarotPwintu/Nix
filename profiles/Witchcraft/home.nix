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
    ../../user/env/Hyprland/default.nix
    ../../user/env/Shell/default.nix
    ../../user/web/browser.nix
  ];

  programs.home-manager.enable = true;

  services.home-manager.autoUpgrade = {
    enable = true;
    frequency = "weekly";
  };

  xdg = {
    enable = true;
    #cacheHome = "~/.cauldron/cache";
    #configHome = "~/.cauldron/config";
    #dataHome = "~/.cauldron/data";
    #stateHome = "~/.cauldron/state";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
    extraConfig = {
      XDG_GAMING_DIR = "${config.home.homeDirectory}/Gaming";
    };
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
    ];
  };

  home = {
    username = "emile";
    homeDirectory = "/home/emile";
  };

  home.stateVersion = "24.05";
}