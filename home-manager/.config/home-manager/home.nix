{ pkgs, ... }:

{
  imports = [
    ./nvim.nix
    ./fonts.nix
    ./fish.nix
    ./git.nix
    ./ghostty.nix
    ./gtk.nix
  ];

  home.username = "sburcksen";
  home.homeDirectory = "/home/sburcksen";

  home.packages = with pkgs; [
    firefox
  ];

  home.file = {
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.11";
}
