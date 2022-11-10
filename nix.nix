{ config, pkgs, ... }:

{
  nix = {
    package = pkgs.nixFlakes;
    # extraOptions = ''
    #   experimental-features = nix-command flakes
    # '';

    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
    # Free up to 1GiB whenever there is less than 100MiB left.
    extraOptions = ''
      min-free = ${toString (100 * 1024 * 1024)}
      max-free = ${toString (1024 * 1024 * 1024)}
    '';
  };
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    nixpkgs-fmt
    rnix-lsp
  ];
}
