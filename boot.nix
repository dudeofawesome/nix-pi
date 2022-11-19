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

    loader = {
      # raspberryPi = {
      #   enable = true;
      #   version = 4;
      #   # hdmi_force_hotplug might work around the lack of display output after initial boot
      #   firmwareConfig = ''
      #     dtparam=sd_poll_once=on
      #     hdmi_force_hotplug=1
      #   '';
      # };

      # Use the systemd-boot EFI boot loader.
      systemd-boot.enable = false;

      generic-extlinux-compatible.enable = true;

      grub.enable = false;
    };
  };
}
