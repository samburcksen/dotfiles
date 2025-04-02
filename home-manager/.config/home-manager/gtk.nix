{ pkgs, ... }:

{
  gtk = {
    enable = true;

    theme.package = pkgs.tokyonight-gtk-theme;
    theme.name = "Tokyonight-Dark";

    iconTheme.package = pkgs.gruvbox-plus-icons;
    iconTheme.name = "Gruvbox-Plus-Dark";

    cursorTheme.package = pkgs.bibata-cursors;
    cursorTheme.name = "Bibata-Original-Classic";
  };
}
