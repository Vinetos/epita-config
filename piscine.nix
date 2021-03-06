{ config, pkgs, ... }:

let 
  gccBase = "gcc -Wextra -Wall -Werror -std=c99 -pedantic *.c";

in {
  home.packages = with pkgs; [
    gdb
    gcc
    clang-tools
    valgrind
    man-pages
    criterion
    flex
    meson
    ninja
  ];

  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
         any-nix-shell fish --info-right | source
       '';
       shellAliases = {
         ll = "ls -lh";
         la = "ls -a";
         ccc = gccBase; 
         ddd = "${gccBase} -g -fsanitize=address";
         ttt = "${gccBase} -lcriterion";
         tg = "git tag | grep ";
       };
     };
  };
}
