# Nerimity AppImage AUR Package

This repository maintains the [Nerimity AppImage AUR package](https://aur.archlinux.org/packages/nerimity-appimage).

## Repository Structure

This repository uses two branches to handle both AUR and GitHub requirements:

- **aur**: Contains only flat files suitable for AUR (no subdirectories)
- **github**: Contains GitHub Actions workflows and additional files

## Automatic Updates

This repository includes GitHub Actions workflow to automatically check for new versions of Nerimity and update the AUR package accordingly.

### Setup Instructions

To set up automatic updates from GitHub to AUR:

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

4. **Add Git configuration as repository variables**:
   - Go to your GitHub repository → Settings → Secrets and variables → Actions → Variables
   - Add the following variables:
     - `GIT_USERNAME`: Your name for Git commits
     - `GIT_EMAIL`: Your email for Git commits

The workflow will:
- Run daily at midnight
- Check for new Nerimity versions
- Update the package files if a new version is found
- Push changes to both GitHub branches and AUR
- Handle direct AUR updates when needed

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

## Development

When making changes to this repository:

1. Make changes to the `github` branch for development
2. The GitHub Actions workflow will automatically update the `aur` branch
3. Only push flat files to the `aur` branch (no subdirectories)
4. Never push the `.github` directory to the `aur` branch or AUR

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