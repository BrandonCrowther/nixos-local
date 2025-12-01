{ config, pkgs, ... }:

{
  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader configuration
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  # Networking
  networking.hostName = "nixos-dev";
  networking.networkmanager.enable = true;

  # Timezone and locale
  time.timeZone = "America/Toronto";
  i18n.defaultLocale = "en_US.UTF-8";

  # User configuration
  users.users.bcrow = {
    isNormalUser = true;
    description = "Brandon Crowther";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
    shell = pkgs.zsh;
  };

  # Enable zsh system-wide
  programs.zsh.enable = true;

  # System packages (minimal for Phase 1)
  environment.systemPackages = with pkgs; [
    # Essential CLI tools
    vim
    git
    curl
    wget
    htop
    tree
    unzip
    zip

    # Network tools
    openssh

    # Build essentials
    gcc
    gnumake
  ];

  # Enable SSH
  services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. Don't change this unless you know what you're doing.
  system.stateVersion = "24.05";
}
