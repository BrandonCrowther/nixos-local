# NixOS Local Development Environment

A reproducible NixOS development environment with Hyprland and cyberpunk theming.

## Quick Start

### Prerequisites
- NixOS installed (or planning to install)
- Flakes enabled in your Nix configuration

### Installation

1. Clone this repository:
```bash
git clone https://github.com/BrandonCrowther/nixos-local.git
cd nixos-local
```

2. Build and apply the configuration:
```bash
sudo nixos-rebuild switch --flake .#nixos-dev
```

3. Reboot your system

## Project Structure

```
.
├── flake.nix           # Flake configuration with inputs and outputs
├── configuration.nix   # System-level NixOS configuration
├── home.nix           # User-level home-manager configuration
├── CLAUDE.MD          # Project roadmap and development phases
└── README.md          # This file
```

## Development Phases

See [CLAUDE.MD](./CLAUDE.MD) for the complete development roadmap.

### Current Phase: Phase 1 - Basic CLI Setup

**Status:** In Progress

**Includes:**
- Flake-based configuration
- Basic system packages
- Home-manager integration
- Git, curl, wget, and essential CLI tools
- Zsh with modern replacements (eza, bat, ripgrep, fd)

## Updating the System

After making changes to the configuration:

```bash
sudo nixos-rebuild switch --flake .#nixos-dev
```

## Notes

- This configuration uses the unstable channel for the latest packages
- Home-manager is integrated for user-level package management
- Configuration is designed to be version-controlled and reproducible
