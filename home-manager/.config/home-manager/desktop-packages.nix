{ pkgs, ... }:

{
  home.packages = with pkgs; [
    firefox
    spotify
    discord
  ];
}
