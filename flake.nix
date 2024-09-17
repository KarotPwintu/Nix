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

  inputs = {

    #---Core---#

    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #---DE---#
    
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

  };  

  outputs = inputs@{ 
    self, 
    nixpkgs,
    home-manager,
    hyprland,
    hyprland-plugins,
    hyprpanel
    }: 
    let

    system = "x86_64-linux";
    pkgs = import nixpkgs.legacyPackages {
        inherit system;
        config = {
          allowUnfree = true;
        };
        overlays = [
        inputs.hyprpanel.overlay
	      ];
    };  

    in {

      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs;
        };
        modules = [
          #./hosts/desktop/default.nix
          ./configuration.nix
        ];
      };
  };
}
