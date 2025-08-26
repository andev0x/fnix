{ lib
, config
, pkgs
, ...
}:

{
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    checkConfig = false;
    extraConfig = builtins.readFile ../../dotfiles/sway/config;
    config.bars = [{
      command = "swaybar_command waybar";
      position = "top";
      mode = "dock";
    }];
  };
  programs.waybar = {
    enable = true;
    style = builtins.readFile ../../dotfiles/sway/waybar/style.css;
  };
  xdg.configFile."waybar/config".source = ../../dotfiles/sway/waybar/config.jsonc;
}

