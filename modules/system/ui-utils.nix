{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.nixosModules.ui-utils;
in {
  options = {
    nixosModules.ui-utils = {
      enable = lib.mkEnableOption "enable ui-utils programs";
    };
  };
  config = lib.mkIf cfg.enable {
    users.users.adrian.packages = with pkgs; [
      systemdgenie
      gparted
      qdirstat
    ];
  };
}
