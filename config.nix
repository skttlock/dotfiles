{ config, pkgs, ... }:

{ 
  environment.systemPackages = with pkgs; [
    framework-tool
    zsa-udev-rules
    nerdfonts
    nushell
    nvim
    mise
    tmux
    git
    kdePackages.yakuake
    obsidian
    firefox
    spotify
    calibre
    firefox-devedition
    vscodium
    libreoffice-qt6-still
    gnucash
    inkscape-with-extensions
    gimp-with-plugins
    tiled
    godot_4
  ];
}