#home
{ config, pkgs, inputs, ... }:

{
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.emile = import ../profiles/Witchcraft/home.nix;
}
