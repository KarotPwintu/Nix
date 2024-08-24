# █     █░ ██▓▄▄▄█████▓ ▄████▄   ██░ ██  ▄████▄   ██▀███   ▄▄▄        █████▒▄▄▄█████▓#
#▓█░ █ ░█░▓██▒▓  ██▒ ▓▒▒██▀ ▀█  ▓██░ ██▒▒██▀ ▀█  ▓██ ▒ ██▒▒████▄    ▓██   ▒ ▓  ██▒ ▓▒#
#▒█░ █ ░█ ▒██▒▒ ▓██░ ▒░▒▓█    ▄ ▒██▀▀██░▒▓█    ▄ ▓██ ░▄█ ▒▒██  ▀█▄  ▒████ ░ ▒ ▓██░ ▒░#
#░█░ █ ░█ ░██░░ ▓██▓ ░ ▒▓▓▄ ▄██▒░▓█ ░██ ▒▓▓▄ ▄██▒▒██▀▀█▄  ░██▄▄▄▄██ ░▓█▒  ░ ░ ▓██▓ ░ #
#░░██▒██▓ ░██░  ▒██▒ ░ ▒ ▓███▀ ░░▓█▒░██▓▒ ▓███▀ ░░██▓ ▒██▒ ▓█   ▓██▒░▒█░      ▒██▒ ░ #
#░ ▓░▒ ▒  ░▓    ▒ ░░   ░ ░▒ ▒  ░ ▒ ░░▒░▒░ ░▒ ▒  ░░ ▒▓ ░▒▓░ ▒▒   ▓▒█░ ▒ ░      ▒ ░░   #
#  ▒ ░ ░   ▒ ░    ░      ░  ▒    ▒ ░▒░ ░  ░  ▒     ░▒ ░ ▒░  ▒   ▒▒ ░ ░          ░    #
#  ░   ░   ▒ ░  ░      ░         ░  ░░ ░░          ░░   ░   ░   ▒    ░ ░      ░      #
#    ░     ░           ░ ░       ░  ░  ░░ ░         ░           ░  ░                 #
#                      ░                ░                                            #

{  
  description = "Black magic for witches";

   #.▄▄ · ▄▄▄ .▄▄▄▄▄▄▄▄▄▄▪   ▐ ▄  ▄▄ • .▄▄ · #
   #▐█ ▀. ▀▄.▀·•██  •██  ██ •█▌▐█▐█ ▀ ▪▐█ ▀. #
   #▄▀▀▀█▄▐▀▀▪▄ ▐█.▪ ▐█.▪▐█·▐█▐▐▌▄█ ▀█▄▄▀▀▀█▄#
   #▐█▄▪▐█▐█▄▄▌ ▐█▌· ▐█▌·▐█▌██▐█▌▐█▄▪▐█▐█▄▪▐█#
   # ▀▀▀▀  ▀▀▀  ▀▀▀  ▀▀▀ ▀▀▀▀▀ █▪·▀▀▀▀  ▀▀▀▀ #
 
   outputs = inputs@{self, ...}: 

    let 

      lib = nixpkg.lib;

      #---System Settings---#

      systemSettings = {
        host = "witchcraft"; 
        system = "x86_64-linux";
      };
      

      mainShell = "zsh";
      term = "kitty";
      bootloader = "grub";
      dmanager = "greetd";

      #---Use Settings---#
      

      userSettings = {
        username = "emile";  
        name = "";
      };

    in {

    #---System---#

    nixosConfigurations = {
      "$user" = lib.nixosSystem {

        system = "x86_64-linux";
        modules = [ ./system/configuration.nix ];
        specialArgs = {}

        }
    };

    #---Home---#

    homeConfigurations = {
      "$user" = homme-manager.lib.homeManagerConfiguration {

        system = "x86_64-linux";
        modules = [ ./usr/home.nix ];
        extraspecialArgs = {}

      }
    }

    }
  };

  #▄▄▄  ▄▄▄ . ▄▄▄·      .▄▄ · #
  #▀▄ █·▀▄.▀·▐█ ▄█▪     ▐█ ▀. #
  #▐▀▀▄ ▐▀▀▪▄ ██▀· ▄█▀▄ ▄▀▀▀█▄#
  #▐█•█▌▐█▄▄▌▐█▪·•▐█▌.▐▌▐█▄▪▐█#
  #.▀  ▀ ▀▀▀ .▀    ▀█▄▀▪ ▀▀▀▀ #

  inputs = {
    #---OS---#
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    #---DE/VM---#
    hyprland = {
        type = "git";
        url = "https://github.com/hyprwm/Hyprland";
        submodules = true;
    };
    hyprland-plugins = {
            url = "github:hyprwm/hyprland-plugins";
            inputs.hyprland.follows = "hyprland";
    };
    hypridle = {
      url = "github:hyprwm/hypridle";
      inputs = {
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };
    hyprlock = {
      url = "github:hyprwm/hyprlock";
      inputs = {
        hyprlang.follows = "hyprland/hyprlang";
        hyprutils.follows = "hyprland/hyprutils";
        nixpkgs.follows = "hyprland/nixpkgs";
        systems.follows = "hyprland/systems";
      };
    };
    hyprland-contrib = {
      url = "github:hyprwm/contrib";
      inputs.nixpkgs.follows = "hyprland/nixpkgs";
    };
    ags.url = "github:Aylur/ags";
  };
}
