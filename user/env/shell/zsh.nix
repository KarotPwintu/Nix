#zsh
{ config, pkgs, inputs, ... }:

{
  #Aliases = {

  #};
  programs = {
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      enableCompletion = true;
      #shellAliases = Aliases;
    };
    starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {};
    };
  };  
}