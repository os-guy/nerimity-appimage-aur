# Nerimity AppImage AUR Package

This repository maintains the [Nerimity AppImage AUR package](https://aur.archlinux.org/packages/nerimity-appimage).

## Important Note About Repository Structure

This repository uses two branches to handle both AUR and GitHub requirements:

- **aur**: Contains only flat files suitable for AUR (no subdirectories)
- **github**: Contains GitHub Actions workflows and additional files

**For development and contributions, please use the `github` branch:**
https://github.com/os-guy/nerimity-appimage-aur/tree/github

The `aur` branch is automatically updated by GitHub Actions and should not be modified directly.

## Automatic Updates Setup

This package uses GitHub Actions for automatic updates. To set it up:

1. **Generate an SSH key pair for AUR**:
   ```bash
   ssh-keygen -t ed25519 -C "your-email@example.com" -f ~/.ssh/aur_key
   ```

2. **Add the public key to your AUR account**:
   - Go to https://aur.archlinux.org/account/
   - Add the content of `~/.ssh/aur_key.pub` to your SSH Public Keys

3. **Add the private key to GitHub repository secrets**:
   - Go to your GitHub repository → Settings → Secrets and variables → Actions
   - Create a new repository secret named `AUR_SSH_PRIVATE_KEY`
   - Paste the content of your private key (`~/.ssh/aur_key`) - NOT the .pub file!
   - Make sure to include the entire key including BEGIN and END lines

4. **Add AUR known hosts to GitHub repository secrets**:
   - Run `ssh-keyscan aur.archlinux.org` on your local machine
   - Create a new repository secret named `AUR_KNOWN_HOSTS`
   - Paste the entire output from the ssh-keyscan command

See the `github` branch README for more detailed instructions.

## Installation

```bash
yay -S nerimity-appimage
```

Or clone this repository and build the package manually:

```bash
git clone https://aur.archlinux.org/nerimity-appimage.git
cd nerimity-appimage
makepkg -si
```

## Manual Update

You can update the package manually by running:

```bash
./update_srcinfo.sh
```

This will:
1. Check for a new version of Nerimity
2. Update the PKGBUILD and .SRCINFO files
3. Commit the changes (but won't push automatically)

## Usage

After installation, you can launch Nerimity from your application menu or by running `nerimity` in your terminal.

## Updating

The package will be updated when new versions are released. To update:

```bash
# Using yay
yay -Syu nerimity-appimage

# Using paru
paru -Syu nerimity-appimage
```

### For Package Maintainers

If you're maintaining this package, you can use the included script to update the package to the latest version:

```bash
./update_srcinfo.sh
```

This will:
1. Fetch the latest version from GitHub
2. Update the PKGBUILD with the new version
3. Generate a new .SRCINFO file

## License

This package is provided without a specific license as the original application doesn't specify one. 