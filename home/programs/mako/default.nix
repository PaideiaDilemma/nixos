{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.hyprhome;
  colors = config.colors;
in
{
  options.hyprhome.mako = {
    enable = mkOption {
      default = true;
      description = "Whether to enable mako notifications.";
      type = types.bool;
    };
  };

  config = mkIf (cfg.gui.enable && cfg.mako.enable) {
    services.mako = {
      enable = true;
      package = pkgs.mako;
      anchor = "bottom-left";
      backgroundColor = "${colors.base.sky_}";
      textColor = "${colors.base.sun}";
      margin = "2";
      #outerMargin = 5;
      borderColor = "${colors.base.sun}";
      borderSize = 1;
      borderRadius = 6;
      progressColor = "over ${colors.six.red}CC";
      icons = true;
    };
  };
}
