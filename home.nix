{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should manage
  home.username = "bcrow";
  home.homeDirectory = "/home/bcrow";

  # This value determines the Home Manager release that your configuration is
  # compatible with. Don't change this unless you know what you're doing.
  home.stateVersion = "24.05";

  # Packages that should be installed to the user profile
  home.packages = with pkgs; [
    # CLI utilities
    ripgrep
    fd
    bat
    eza
    fzf
    jq
    tmux

    # Development tools
    nodejs_22
    python3

    # Claude CLI (will be added when available in nixpkgs)
  ];

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Brandon Crowther";
    userEmail = "bcrow@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = false;
    };
  };

  # Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza";
      cat = "bat";
      grep = "rg";
      find = "fd";
    };

    initExtra = ''
      # Custom zsh configuration
      export EDITOR=vim
    '';
  };

  # Let Home Manager install and manage itself
  programs.home-manager.enable = true;
}
