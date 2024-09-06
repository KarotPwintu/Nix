#boot
{ config, pkgs, ... }:

{
  boot = {
    plymouth = {
      enable = true;
      #theme = "catppuccin-plymouth";
      themePackages = [
        pkgs.catppuccin-plymouth
      ];
    };
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        #theme = ;
        efiSupport = true;
        #zfsSupport = true;
      };
    };
  };

#  boot.loader.grub = {
#    enable = true;
#    zfsSupport = true;
#    efiSupport = true;
#    efiInstallAsRemovable = true;
#    mirroredBoots = [
#      { devices = [ "nodev"]; path = "/boot"; }
#    ];
#  };
#
#  fileSystems."/" =
#    { device = "zpool/root";
#      fsType = "zfs";
#    };
#
#  fileSystems."/nix" =
#    { device = "zpool/nix";
#      fsType = "zfs";
#    };
#
#  fileSystems."/var" =
#    { device = "zpool/var";
#      fsType = "zfs";
#    };
#
#  fileSystems."/home" =
#    { device = "zpool/home";
#      fsType = "zfs";
#    };
#
#  fileSystems."/boot" =
#    { device = "/dev/disk/by-uuid/2A11-F4EF";
#      fsType = "vfat";
#    };
#
#  swapDevices = [ ];
}
