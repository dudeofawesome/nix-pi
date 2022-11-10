{ config, pkgs, epkgs, ... }:
{
  networking = {
    hostName = "doa-pi"; # Define your hostname.

    wireless = {
      enable = true;
      interfaces = [ "wlan0" ];
      networks."orleans".psk = (lib.fileContents "/secret/orleans");
    };

    # The global useDHCP flag is deprecated, therefore explicitly set to false here.
    # Per-interface useDHCP will be mandatory in the future, so this generated config
    # replicates the default behaviour.
    useDHCP = false;
    interfaces.eno1.useDHCP = true;

    # Open ports in the firewall.
    firewall = {
      enable = true;

      allowedTCPPorts = [
        22 # ssh
        2022 # et
        8080 # http
        8443 # https
      ];
      # allowedUDPPorts = [ ... ];
    };
  };

  services.avahi = {
    enable = true;
    publish = {
      enable = true;
      addresses = true;
    };
  };
}
