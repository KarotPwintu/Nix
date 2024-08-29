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
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };

      #---System Settings---#

      systemSettings = {
        host = "desktop";
        profile = "";
        system = "x86_64-linux";
        locale = "en_US.UTF-8";
        keylocale = "fr";
        timezone = "Europe/Brussels"
      };
      
      #---User Settings---#
      

      userSettings = {
        username = "emile";  
        name = "";
      };

    in {

    #---System---#

    nixosConfigurations = {
      "${host}" = lib.nixosSystem {

        modules = [ stylix.nixosModules.stylix ./system/configuration.nix ];
        system = systemSettings.system;
        specialArgs = {
            inherit systemSettings;
            inherit userSettings;
            inherit inputs
            };

        };
    };

    #---Home---#

    homeConfigurations = {
      "${username}" = home-manager.lib.homeManagerConfiguration {

        inherit pkgs

        modules = [ ./user/home.nix ];
        system = systemSettings.system;
        extraspecialArgs = {
            inherit systemSettings;
            inherit userSettings;
            inherit inputs 
            };

      };
    };

    };
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
    stylix.url = "github:danth/stylix";
    nix-colors.url = "github:misterio77/nix-colors";
    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";
    #disko.url = "github:nix-community/disko";
    #disko.inputs.nixpkgs.follows = "nixpkgs";
    #chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
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
nixvim = {
      
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    nix-software-center.url = "github:snowfallorg/nix-software-center";
    nixos-conf-editor.url = "github:snowfallorg/nixos-conf-editor";
  };
}
