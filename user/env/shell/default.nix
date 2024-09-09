#default shell
{ config, pkgs, inputs, ... }:

{
  imports = [
    ./zsh.nix
  ];

  #defaultUserShell = pkgs.zsh;

  programs = {
    bat = {
      enable = true;
      #config = {};
      syntaxes = {};
    };
    #bun = {};
    eza = {
      enable = true;
      enableZshIntegration = true;
      extraOptions = [];
      git = true;
      icons = true;
    };
    fastfetch = {
      enable = true;
    };
    fd = {
      enable = true;
      extraOptions = [];
      hidden = true; 
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    gh = {
      enable = true;
      extensions = [];
      settings = {};
    };
    git = {
      enable = true;
      userEmail = "";
      userName = "";
    };
    #hyfetch = {};
    #jq = {};
    ranger = {
      enable = true;
    };
    yt-dlp = {
      enable = true;
    };
    zoxide = {
      enable = true;
      enableZshIntegration = true;
      
    };
  };
}