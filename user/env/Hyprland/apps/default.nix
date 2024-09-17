{ config, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland.settings.exec-once = [
  "hyprpanel &"
  "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP &"
  ];
}
