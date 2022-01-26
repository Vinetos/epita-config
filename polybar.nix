{ pkgs, ... }:

# @author Vinetos

let
  background = "#000";
  background-alt = "#99333333";
  foreground = "#dadfe1";
  foreground-alt = "#555";
  primary = "#cd84f1";
  secondary = "#6ef9f9";
  alert = "#751715";

in
  {
    enable = true;
  
    package = pkgs.polybar.override {
      i3GapsSupport = true;
      alsaSupport = true;
    };
    
    script = "PATH=$PATH:${pkgs.i3}/bin polybar top &";
  
    config = {
      "global/wm" = {
        margin-bottom = 0;
        margin-top = 0;
      };

      "bar/top" = {
        width = "100%";
        height = 30;
        radius = 0;
        fixed-center = true;

        background = background;
        foreground = foreground;

        line-size = 3;
        line-color = "#f00";

        border-size = 0;
        border-color = "#000";

        padding-left = 0;
        padding-right = 4;

        module-margin-left = 3;
        module-margin-right = 3;

        font-0 = "Iosevkka Term:size=10;2";
        font-1 = "Font Awesome 5 Free:pixelsize=10;1";
        font-2 = "Font Awesome 5 Free Solid:pixelsize=10;1";
        font-3 = "Font Awesome 5 Brands:pixelsize=10;1";

        modules-left = "i3 xwindow";
        modules-center = "";
        modules-right = "xkeyboard date";

        tray-position = "right";
        tray-padding = 2;
      };

      "module/xwindow" = {
        type = "internal/xwindow";
        label = "%title:0:64:...%";
      };
      
      "module/i3" = {
        type = "internal/i3";
        format = "<label-state> <label-mode>";
        index-sort = true;
        wrapping-scroll = true;
        strip-wsnumbers = true;
	
        label-mode = "%mode%";
        label-mode-padding = 4;
        label-mode-foreground = foreground;
        label-mode-background = primary;

        label-focused = "%name%";
        label-focused-background = background-alt;
        label-focused-underline = primary;
        label-focused-padding = 4;
	
        label-unfocused = "%name%";
        label-unfocused-padding = 4;	
      	label-visible = "V %index%";
        label-visible-background = "\${self.label-focused-background}";
        label-visible-underline = "\${self.label-focused-background}";
        label-visible-padding = "\${self.label-focused-padding}";
	
      	label-urgent = "";
        label-urgent-background = alert;
        label-urgent-padding = 4;
      };

      "module/xkeyboard" = {
        type = "internal/xkeyboard";
        label-layout = "%layout%";
      };

      "module/date" = {
        type = "internal/date";
        interval = 5;

        date = "";
        date-alt = "%Y-%m-%d";

        time = "%I:%M %p";
        time-alt = "";

        format-prefix = "";
        format-prefix-foreground = foreground-alt;
        format-underline = primary;
        label = "%date% %time%";
      };

      "settings" = {
        screenchange-reload = true;
      };   
      
    };
  }
