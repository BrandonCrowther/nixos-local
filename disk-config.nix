{ lib, ... }:
let
  # Read the disk device from environment variable or use default
  diskDevice = builtins.getEnv "DISK_DEVICE";
  finalDiskDevice = if diskDevice != "" then diskDevice else "/dev/sda";
in
{
  disko.devices = {
    disk = {
      main = {
        type = "disk";
        device = finalDiskDevice;
        content = {
          type = "gpt";
          partitions = {
            boot = {
              size = "512M";
              type = "EF00";
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
              };
            };
            root = {
              size = "100%";
              content = {
                type = "filesystem";
                format = "ext4";
                mountpoint = "/";
              };
            };
          };
        };
      };
    };
  };
}
