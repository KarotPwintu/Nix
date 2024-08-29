# ██░ ██  ▒█████   ███▄ ▄███▓▓█████ 
#▓██░ ██▒▒██▒  ██▒▓██▒▀█▀ ██▒▓█   ▀ 
#▒██▀▀██░▒██░  ██▒▓██    ▓██░▒███   
#░▓█ ░██ ▒██   ██░▒██    ▒██ ▒▓█  ▄ 
#░▓█▒░██▓░ ████▓▒░▒██▒   ░██▒░▒████▒
# ▒ ░░▒░▒░ ▒░▒░▒░ ░ ▒░   ░  ░░░ ▒░ ░
# ▒ ░▒░ ░  ░ ▒ ▒░ ░  ░      ░ ░ ░  ░
# ░  ░░ ░░ ░ ░ ▒  ░      ░      ░   
# ░  ░  ░    ░ ░         ░      ░  ░
#                                   

# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: { 
  # You can import other home-manager modules here
  imports = [

    ../themes/.default.nix
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix

    ./shell/zsh.nix
# ___         _   _            
#|   \ ___ __| |_| |_ ___ _ __ 
#| |) / -_|_-< / /  _/ _ \ '_ \
#|___/\___/__/_\_\\__\___/ .__/
#                        |_|   

    ./env/Hyprland/default.nix

# _   _                 _                
#| | | |___ ___ _ _    /_\  _ __ _ __ ___
#| |_| (_-</ -_) '_|  / _ \| '_ \ '_ (_-<
# \___//__/\___|_|   /_/ \_\ .__/ .__/__/
#                          |_|  |_|      

    ./apps/.default.nix
    ./web/webapps.nix

#__      __   _    
#\ \    / /__| |__ 
# \ \/\/ / -_) '_ \
#  \_/\_/\___|_.__/
#                  

    ./web/browser.nix
    ./web/tor.nix   
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # TODO: Set your username
  home = {
    username = ${username};
    homeDirectory = "/home/${username}";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs.git.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.05";
}
