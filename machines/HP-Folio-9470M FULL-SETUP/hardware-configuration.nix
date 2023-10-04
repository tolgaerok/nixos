# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.

#---------------------------------------------------------------------
# Imports and basic configuration
#---------------------------------------------------------------------
{ config, lib, pkgs, modulesPath, ... }:

{
  #---------------------------------------------------------------------
  # Module imports
  #---------------------------------------------------------------------
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  #---------------------------------------------------------------------
  # Boot configuration
  #---------------------------------------------------------------------
  boot = {

    extraModulePackages = [ ];
    initrd.kernelModules = [ ];
    kernelModules = [ "kvm-intel" ];
    kernelParams = [ "mitigations=off" ];
    initrd.availableKernelModules = [

      "ahci"
      "ehci_pci"
      "sd_mod"
      "sdhci_pci"
      "uas"
      "usb_storage"
      "usbhid"
      "xhci_pci"

    ];
  };

  #---------------------------------------------------------------------
  # File system configurations
  #---------------------------------------------------------------------
  fileSystems."/" = {
    device = "/dev/disk/by-uuid/2251e0b4-fe3b-4cfd-b0c6-3b0e5a9bc96b";
    fsType = "ext4";

    # Optimize SSD
    options = [

      "data=ordered"
      "discard"
      "errors=remount-ro"
      "noatime"
      "nodiratime"

    ];

  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/E73E-5FCA";
    fsType = "vfat";
  };

  fileSystems."/mnt/sambashare" =

    {
      device = "//192.168.0.20/LinuxData/HOME/PROFILES/NIXOS-23-05/TOLGA/";
      fsType = "cifs";
      options = let
        automountOpts =
          "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,x-systemd.requires=network.target";
        uid =
          "1000"; # Replace with your actual user ID, use `id -u <YOUR USERNAME>` to get your user ID
        gid =
          "100"; # Replace with your actual group ID, use `id -g <YOUR USERNAME>` to get your group ID
        vers = "3.1.1";
        cacheOpts = "cache=loose";
        credentialsPath = "/etc/nixos/core/system/network/smb-secrets";

      in [
        "${automountOpts},credentials=${credentialsPath},uid=${uid},gid=${gid},vers=${vers},${cacheOpts}"
      ];

    };

  #---------------------------------------------------------------------
  # Swap device configuration
  #---------------------------------------------------------------------
  swapDevices =
    [{ device = "/dev/disk/by-uuid/60d7ba76-84fb-4252-9ec9-abd5fbe25db7"; }];

  #---------------------------------------------------------------------
  # Networking configurations
  #---------------------------------------------------------------------
  networking.useDHCP = lib.mkDefault true;

  #---------------------------------------------------------------------
  # Host platform and hardware configurations
  #---------------------------------------------------------------------
  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.intel.updateMicrocode =
    lib.mkDefault config.hardware.enableRedistributableFirmware;
}
