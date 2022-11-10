{ config, pkgs, ... }:

{

  boot = {
    kernelPackages = pkgs.linuxPackages_rpi4;
    tmpOnTmpfs = true;
    initrd.availableKernelModules = [ "usbhid" "usb_storage" ];
    # ttyAMA0 is the serial console broken out to the GPIO
    kernelParams = [
      "8250.nr_uarts=1"
      "console=ttyAMA0,115200"
      "console=tty1"
      # A lot GUI programs need this, nearly all wayland applications
      "cma=128M"
    ];

    # Use the systemd-boot EFI boot loader.
    # loader.systemd-boot.enable = true;

    loader = {
      raspberryPi = {
        enable = true;
        version = 4;
        firmwareConfig = "dtparam=sd_poll_once=on";
      };

      grub.enable = false;
    };
  };
}
