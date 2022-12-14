# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "ehci_pci" "megaraid_sas" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/dc4d8ebf-130e-4a02-bd4b-0590906dc3a1";
      fsType = "ext4";
    };

  fileSystems."/boot/efi" =
    { device = "/dev/disk/by-uuid/9E9B-A923";
      fsType = "vfat";
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/c4874bd2-f37d-4a61-8450-f1f27226b169";
      fsType = "btrfs";
    };

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}