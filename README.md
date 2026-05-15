# Pop-OS Dotfiles

Personal Linux development environment managed with [chezmoi](https://www.chezmoi.io/).

This repository bootstraps a full terminal-focused setup with:

- Zsh + Oh My Zsh + Powerlevel10k
- Starship prompt
- Useful CLI tools (fzf, zoxide, neovim, etc.)
- Language tooling (Node via mise, Python via uv, Rust via rustup)
- Docker + user group setup
- VS Code settings and extensions

The scripts currently support Debian-based distros (including Pop!_OS/Ubuntu) and Fedora.

## Repository Layout

- `dot_*` files -> copied to your `$HOME` by chezmoi
- `dot_config/Code/User/settings.json` -> VS Code user settings
- `dot_vscode-extensions.txt` -> VS Code extensions to install
- `scripts/*.sh` -> package/tool installers
- `run_once_before_install-packages.sh.tmpl` -> main installation entrypoint
- `run_once_after_setup-shell.sh.tmpl` -> post-setup shell and editor tasks

## Quick Start (Recommended)

1. Install chezmoi:

	```bash
	sh -c "$(curl -fsLS get.chezmoi.io)"
	```

2. Apply this dotfiles repo:

	```bash
	chezmoi init --apply ovezthaking/Pop-OS-dotfiles
	```

During apply, chezmoi runs the `run_once_*` scripts automatically.

## What Gets Installed

The main setup flow is:

1. `scripts/base.sh`
	- Installs core packages (`git`, `curl`, `wget`, `unzip`, `fzf`, `zoxide`, `neovim`, `zsh`, build tools)

2. `scripts/shell.sh`
	- Installs Oh My Zsh
	- Installs Starship
	- Installs zsh plugins (`zsh-autosuggestions`, `zsh-syntax-highlighting`)

3. `scripts/node.sh`
	- Installs mise (if missing)
	- Installs and activates Node LTS globally

4. `scripts/rust.sh`
	- Installs Rust toolchain with rustup

5. `scripts/python.sh`
	- Installs `uv`

6. `scripts/docker.sh`
	- Installs Docker
	- Enables and starts the Docker service
	- Adds your user to the `docker` group

7. `scripts/vscode.sh`
	- Installs extensions from `~/.vscode-extensions.txt`

Then post-setup tasks run:

- Sets default shell to zsh
- Installs `fzf-tab`
- Ensures useful directories exist
- Re-runs VS Code extension install if `code` is available

## Manual Apply / Re-Apply

Run this any time after editing your dotfiles:

```bash
chezmoi apply -v
```

Preview changes first:

```bash
chezmoi diff
```

## Update Workflow

If this repo is already initialized:

```bash
chezmoi update -v
```

This pulls latest changes and applies them.

## Optional One-Shot Installer

This repo also includes `~/.local/bin/install.sh` (from `dot_local/bin/executable_install.sh`) as a direct installer script.

Use it only if you want a manual script-based setup outside the regular chezmoi run-once flow.

## Notes

- A logout/login (or reboot) may be needed after Docker group changes.
- If shell changes do not apply immediately, restart your terminal.
- If VS Code extensions fail to install, ensure the `code` CLI is available in PATH.

## License

This repository is for personal environment setup. 
