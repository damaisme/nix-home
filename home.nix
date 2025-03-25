{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprland waybar kitty dmenu rofi nwg-look
  ];

  programs.hyprland.enable = true;

  # Environment variables
  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    XDG_SESSION_TYPE = "wayland";
    XDG_CURRENT_DESKTOP = "Hyprland";
  };
}
