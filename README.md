# Nerimity AppImage for Arch Linux

This is an AUR package for [Nerimity](https://github.com/Nerimity/nerimity-desktop), a modern chat application.

## Installation

You can install this package from the AUR using your preferred AUR helper:

```bash
# Using yay
yay -S nerimity-appimage

# Using paru
paru -S nerimity-appimage
```

Or manually:

```bash
git clone https://aur.archlinux.org/nerimity-appimage.git
cd nerimity-appimage
makepkg -si
```

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