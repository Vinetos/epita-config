{ config, pkgs, ... }:

let 
  nvim = "https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz";

in {
  nixpkgs.overlays = [
#    (import (builtins.fetchTarball {
 #     url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  #  }))
    #self: super: { discord = super.discord.overrideAttrs (_: { src = builtins.fetchTarball url; });})
  ];

}
