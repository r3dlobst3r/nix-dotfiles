{ config, pkgs, ... }:

{
  imports = [
    ../home.nix
    ../../modules/home
  ];

  home.packages = with pkgs; [
  ];

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "github.com" = {
        addKeysToAgent = "yes";
        identityFile = "${config.home.homeDirectory}/.ssh/server";
        extraOptions = {
          UseKeychain = "yes";
        };
      };
    };
  };

  programs.nh = {
    enable = true;
    clean.enable = false;
    clean.extraArgs = "--keep-since 4d --keep 3";
  };
  app.shared.zen-browser.enable = false;
}
