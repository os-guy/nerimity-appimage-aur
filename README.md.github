# Nerimity AppImage AUR Package

This repository maintains the [Nerimity AppImage AUR package](https://aur.archlinux.org/packages/nerimity-appimage).

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
   - Paste the content of your private key (`~/.ssh/aur_key`)

4. **Add Git configuration as repository variables**:
   - Go to your GitHub repository → Settings → Secrets and variables → Actions → Variables
   - Add the following variables:
     - `AUR_USERNAME`: Your name for Git commits
     - `AUR_EMAIL`: Your email for Git commits

5. **Upload the workflow file**:
   - Upload the `update-aur.yml` file to `.github/workflows/` in your GitHub repository

The workflow will:
- Run daily at midnight
- Check for new Nerimity versions
- Update the package files if a new version is found
- Push changes to both GitHub and AUR

You can also manually trigger the workflow from the Actions tab in your GitHub repository.

## Manual Update

You can also update the package manually by running:

```bash
./update_srcinfo.sh
```

This will:
1. Check for a new version of Nerimity
2. Update the PKGBUILD and .SRCINFO files
3. Commit the changes (but won't push automatically) 