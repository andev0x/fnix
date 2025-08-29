# NixOS & Nix-Darwin Configurations

This repository contains my personal Nix flake for managing system configurations and dotfiles across various machines, including NixOS (Linux) and nix-darwin (macOS) systems, using Home Manager.

## Features

*   **Declarative System Configurations:** Manage your entire operating system configuration for NixOS and macOS (via nix-darwin) in a reproducible way.
*   **Dotfile Management:** Centralized management of dotfiles and user-specific packages using Home Manager.
*   **Hardware Integration:** Includes configurations for specific hardware (e.g., Microsoft Surface Pro 7) using `nixos-hardware`.
*   **Homebrew Integration:** Seamless integration with Homebrew on macOS through `nix-homebrew`.

## Project Structure

*   `flake.nix`: The main Nix flake definition, specifying inputs and outputs (NixOS, nix-darwin, Home Manager configurations).
*   `nixos/`: Contains NixOS system configurations for different machines (e.g., `desk`, `surface-pro-7`, `minimal-vm`, `work-vm`).
*   `dotfiles/`: Stores various dotfiles managed by Home Manager (e.g., `nvim`, `alacritty`, `sway`, `tmux`, `wezterm`).
*   `modules/`: Reusable Nix modules used across different configurations.
*   `users/`: Defines Home Manager configurations for different users and systems.

## Installation Guide

### Prerequisites

Before proceeding, ensure you have Nix installed on your system and that [Nix flakes are enabled](https://nixos.wiki/wiki/Flakes#Enable_flakes).

### Mount (simulator)
lsblk
Partition
sudo parted /dev/vda -- mklabel gpt
sudo parted /dev/vda -- mkpart ESP fat32 1MiB 512MiB
sudo parted /dev/vda -- set 1 esp on
sudo parted /dev/vda -- mkpart primary ext4 512MiB 100%
Format
sudo mkfs.fat -F 32 /dev/vda1
sudo mkfs.ext4 /dev/vda2
Mount /mnt
sudo mount /dev/vda2 /mnt
sudo mkdir -p /mnt/boot
sudo mount /dev/vda1 /mnt/boot

### Install :w


### Cloning the Repository

First, clone this repository to your local machine:

```bash
git clone https://github.com/andev0x/fnix.git
cd fnix
```

### NixOS Systems

To apply a NixOS configuration, navigate to the cloned repository and run the `nixos-rebuild` command, specifying the desired system from the `nixosConfigurations` defined in `flake.nix`.

For example, to apply the `desk` configuration:

```bash
sudo nixos-rebuild switch --flake .#desk
```

Or for `surface`:

```bash
sudo nixos-rebuild switch --flake .#surface
```

### Nix-Darwin (macOS) Systems

For macOS systems using nix-darwin, use the `darwin-rebuild` command. The primary macOS configuration is typically named `com-mac` in this flake.

```bash
darwin-rebuild switch --flake .#com-mac
```

### Home Manager Configurations

Home Manager configurations can be applied independently or as part of a NixOS/nix-darwin system. To apply a specific Home Manager configuration, use the `home-manager switch` command, referencing the desired user configuration from `homeConfigurations` in `flake.nix`.

For example, to apply the `desk` user's Home Manager configuration:

```bash
home-manager switch --flake .#desk
```

Or for the `com-mac` user on macOS:

```bash
home-manager switch --flake .#com-mac
```

### Customization

To adapt these configurations for your own system, you will typically:

1.  **Fork this repository.**
2.  **Modify `flake.nix`:** Adjust inputs, outputs, and system names to match your setup.
3.  **Create/Modify configurations:**
    *   Add or modify files in `nixos/` for your NixOS machines.
    *   Adjust `users/` configurations for your specific user setups.
    *   Update `dotfiles/` with your preferred dotfiles.
    *   Create new modules in `modules/` for reusable components.

Remember to replace `andev0x/fnix.git` with your actual repository URL if you fork this project.

> Thanks to Kunkka for sharing the config
