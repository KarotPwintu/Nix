#  ██████▓██   ██▓  ██████ ▄▄▄█████▓▓█████  ███▄ ▄███▓#
#▒██    ▒ ▒██  ██▒▒██    ▒ ▓  ██▒ ▓▒▓█   ▀ ▓██▒▀█▀ ██▒#
#░ ▓██▄    ▒██ ██░░ ▓██▄   ▒ ▓██░ ▒░▒███   ▓██    ▓██░#
#  ▒   ██▒ ░ ▐██▓░  ▒   ██▒░ ▓██▓ ░ ▒▓█  ▄ ▒██    ▒██ #
#▒██████▒▒ ░ ██▒▓░▒██████▒▒  ▒██▒ ░ ░▒████▒▒██▒   ░██▒#
#▒ ▒▓▒ ▒ ░  ██▒▒▒ ▒ ▒▓▒ ▒ ░  ▒ ░░   ░░ ▒░ ░░ ▒░   ░  ░#
#░ ░▒  ░ ░▓██ ░▒░ ░ ░▒  ░ ░    ░     ░ ░  ░░  ░      ░#
#░  ░  ░  ▒ ▒ ░░  ░  ░  ░    ░         ░   ░      ░   #
#      ░  ░ ░           ░              ░  ░       ░   #
#         ░ ░                                         #
{ config, pkgs, inputs, ... }:

{
  imports = [

    ../../modules/default.nix
    ../../system/audio/default.nix
    ../../system/boot/default.nix
    ../../system/kernel/lqx.nix
    ../../system/networks/default.nix
    ../../user/default.nix
    
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.home-manager
    #inputs.disko.nixosModules.disko
  ];

  #---core---#

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  #services.flatpak.enable = true;

  programs.regreet.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland";
        user = "greeter";
      };
    };

  };

  users.users.emile = {
    isNormalUser = true;
    description = "Emile";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      spotify
      kitty
      nautilus
      stremio
      zerotierone
      discord
      vscodium
    ];
  };

  #---time---#

  time.timeZone = "Europe/Brussels";

  #---language---#

  i18n.defaultLocale = "en_GB.UTF-8";

  services.xserver.xkb = {
    layout = "en";
    variant = "";
  };

  console.keyMap = "en";
  

  system.stateVersion = "24.11";
}