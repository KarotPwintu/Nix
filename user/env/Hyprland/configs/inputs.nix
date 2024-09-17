#inputs
{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland.input = [
    "kb_layout = en"
  ];
}