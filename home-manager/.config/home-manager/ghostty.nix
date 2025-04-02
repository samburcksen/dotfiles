{ ... }:

{
  programs.ghostty = {
    enable = true;

    settings = { 
      gtk-titlebar = false;
      background-opacity = 0.5;
      theme = "tokyonight";
      font-family = "JetBrainsMono";
      confirm-close-surface = false;

      keybind = "f11=toggle_fullscreen";
    };
  };
}
