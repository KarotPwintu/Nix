#greetd
{ config, pkgs, inputs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {};
  };
}