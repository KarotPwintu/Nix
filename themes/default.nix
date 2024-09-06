#theme
{ config, pkgs, inputs, ... }:
{
  stylix.enable = true;
  stylix.fonts = {
    serif = {
      package = inputs.apple-fonts.packages.${pkgs.system}.ny;
      name = "New York";
    };

    sansSerif = {
      package = inputs.apple-fonts.packages.${pkgs.system}.sf-pro;
      name = "San Francisco Pro";
    };

    monospace = {
      package = pkgs.maple-mono-NF;
      name = "Maple Mono NF";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
  stylix.image = ./nixwall.jpg;
  #stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/woodland.yaml";
  #tarot woodland moonlight
} 