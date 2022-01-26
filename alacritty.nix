{ pkgs, ... }:

{
  enable = true;

  settings = {
    live_config_reload = true;

    window = {
      title = "Terminal";
    };

    background_opacity = 0.2;

    font = {
      normal.family = "Fira Code";
      normal.style = "Regular";
      size = 10.0;
    };

    cursor.style = "Underline";

    shell = {
      program = "${pkgs.fish}/bin/fish";
      args = [ "--init-command" "echo; neofetch --disable packages memory gpu; echo" ];
    };

    # Colors from https://github.com/alebelcor/alacritty-snazzy
    colors = {
      primary = {
        background = "#282a36";
        foreground = "#eff0eb";
      };
      cursor = {
        cursor = "#97979b";
      };
      normal = {
        black   = "#282a36";
        red     = "#ff5c57";
        green   = "#5af78e";
        yellow  = "#f3f99d";
        blue    = "#57c7ff";
        magenta = "#ff6ac1";
        cyan    = "#9aedfe";
        white   = "#f1f1f0";
      };
      bright = {
        black   = "#f1f1f0";
        red     = "#ff5c57";
        green   = "#5af78e";
        yellow  = "#f3f99d";
        blue    = "#57c7ff";
        magenta = "#ff6ac1";
        cyan    = "#9aedfe";
        white   = "#eff0eb";
      };
    };
  };
}
