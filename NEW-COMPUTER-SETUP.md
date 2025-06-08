# NEW-COMPUTER-SETUP.md

## Complete Setup Guide for math252-summer Repository

This guide provides step-by-step instructions for restoring the `math252-summer` repository on a new computer with zero data loss.

## Prerequisites

Before starting, ensure you have:
- [ ] Complete backup files (from `create-backup.sh`)
- [ ] SSH keys for GitHub access (particularly the `github-work` SSH key)
- [ ] Git installed on new computer
- [ ] Claude Code installed (optional, for development environment)

## Phase 1: System Preparation

### 1.1 Install Required Software

```bash
# Install Git (if not already installed)
# On Ubuntu/Debian:
sudo apt update && sudo apt install git

# On macOS:
brew install git

# On Fedora:
sudo dnf install git
```

### 1.2 Configure Git User Settings

```bash
git config --global user.name "jjohnson-47"
git config --global user.email "jjohnson47@alaska.edu"
```

## Phase 2: SSH Key Setup

### 2.1 Restore SSH Keys

```bash
# Create SSH directory if it doesn't exist
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Copy your SSH keys to the new computer
# (Replace with your actual key files)
cp /path/to/backup/ssh-keys/* ~/.ssh/
chmod 600 ~/.ssh/id_*
chmod 644 ~/.ssh/*.pub
```

### 2.2 Configure SSH for GitHub

The repository uses a custom SSH configuration (`github-work` prefix). Create or update `~/.ssh/config`:

```bash
# Add this to ~/.ssh/config
Host github-work
    HostName github.com
    User git
    IdentityFile ~/.ssh/id_rsa_work
    # or whatever your work SSH key is named
```

### 2.3 Test SSH Connection

```bash
ssh -T github-work
# Should return: Hi jjohnson-47! You've successfully authenticated...
```

## Phase 3: Repository Restoration

### 3.1 Create Project Directory

```bash
mkdir -p ~/Projects
cd ~/Projects
```

### 3.2 Extract and Restore Repository

#### Option A: From Compressed Archive

```bash
# Extract the backup archive
tar -xzf math252-summer-backup-YYYYMMDD_HHMMSS.tar.gz
cd math252-summer-backup-YYYYMMDD_HHMMSS

# Verify backup integrity
./verify-backup.sh

# Copy complete repository
cp -r complete-repo ~/Projects/math252-summer
cd ~/Projects/math252-summer
```

#### Option B: From Directory Backup

```bash
# Copy the complete repository backup
cp -r /path/to/backup/complete-repo ~/Projects/math252-summer
cd ~/Projects/math252-summer
```

### 3.3 Restore Git Repository

```bash
# Initialize git in the restored directory
git init

# Add the original remote
git remote add origin github-work:jjohnson-47/math252-summer.git

# Restore git configuration from backup
cp /path/to/backup/config/git-config .git/config

# Fetch all branches and history
git fetch origin
git branch --set-upstream-to=origin/main main
```

## Phase 4: Verify Critical Content

### 4.1 Check Repository Structure

```bash
# Verify total size (should be ~13MB)
du -sh .

# Check that all critical directories exist
ls -la staging/ migrate/ docs/ weekly-modules/ welcome-module/
```

### 4.2 Verify Large Files

```bash
# Check for the largest file (3.4MB)
ls -lh staging/sec5-5-q4.png
ls -lh migrate/MATH_252/assets/images/chapter5/sec5-5-q4.png

# Verify PDF content
ls -lh staging/*.pdf
```

### 4.3 Check Git Status

```bash
# Should show untracked files in staging/ and root
git status

# Should show proper remote configuration  
git remote -v
```

## Phase 5: Development Environment Setup

### 5.1 Claude Code Configuration (Optional)

If using Claude Code for development:

```bash
# Create Claude directory
mkdir -p .claude

# Restore Claude settings if backed up
cp /path/to/backup/config/claude-settings.json .claude/settings.local.json
```

### 5.2 Verify Repository Function

```bash
# Test that you can access the repository
git log --oneline -5

# Test that you can make changes (optional)
# git add . && git commit -m "Test commit after migration"
# git push origin main
```

## Phase 6: Verification Checklist

### 6.1 File Verification

- [ ] Repository size is ~13MB
- [ ] `/staging/` directory exists with 3.7MB of content
- [ ] `/migrate/` directory exists with 7.4MB of content  
- [ ] `sec5-5-q4.png` file is 3.4MB
- [ ] All PDF files in `/staging/` are present
- [ ] SVG diagrams are present
- [ ] LaTeX files are present

### 6.2 Git Verification

- [ ] Remote URL is `github-work:jjohnson-47/math252-summer.git`
- [ ] Can fetch from remote without errors
- [ ] Git history is intact
- [ ] User configuration is correct

### 6.3 Content Verification

- [ ] All weekly modules are present
- [ ] Template files are intact
- [ ] Course documents are available
- [ ] Image files display correctly
- [ ] Educational content is complete

## Phase 7: Final Steps

### 7.1 Test Repository Access

```bash
# Test pulling latest changes
git pull origin main

# Verify everything is working
git status
```

### 7.2 Clean Up Backup Files

After verifying everything works:

```bash
# Optionally remove backup files from new computer
# (Keep the original backup files safe elsewhere)
```

## Common Issues and Solutions

### SSH Key Problems

**Problem**: `Permission denied (publickey)` error
**Solution**: 
1. Verify SSH key permissions: `chmod 600 ~/.ssh/id_rsa*`
2. Check SSH config: `cat ~/.ssh/config`
3. Test connection: `ssh -T github-work`

### Missing Large Files

**Problem**: Files in `/staging/` or `/migrate/` are missing
**Solution**:
1. Check that you restored from `complete-repo/` directory, not just git clone
2. Verify backup integrity with `verify-backup.sh`
3. Re-extract from compressed backup

### Git Remote Issues

**Problem**: Cannot push/pull from repository
**Solution**:
1. Verify remote URL: `git remote -v`
2. Check SSH configuration
3. Manually set remote: `git remote set-url origin github-work:jjohnson-47/math252-summer.git`

## Repository-Specific Notes

### About This Repository

- **No build process** - This is a static content authoring system
- **Educational content** - Contains course materials that must be preserved
- **Blackboard integration** - HTML files designed for LMS import
- **Template-based** - Uses templates for creating new content

### Important Directories

- `/staging/` - **CRITICAL** - Contains untracked educational materials
- `/migrate/` - **CRITICAL** - May contain alternative repository structure
- `/weekly-modules/` - Primary workspace for course content
- `/templates/` - Reusable content templates
- `/docs/examples/` - Previous semester implementations

## Success Verification

Your migration is successful when:

1. ✅ Repository total size is ~13MB
2. ✅ All untracked content from `/staging/` and `/migrate/` is present
3. ✅ Git operations work without errors
4. ✅ SSH authentication works with GitHub
5. ✅ All educational content (PDFs, images, etc.) is accessible
6. ✅ File permissions are correct

## Support

If you encounter issues:

1. Check the `BACKUP_INVENTORY.txt` file from your backup
2. Run the `verify-backup.sh` script to confirm backup integrity
3. Refer to the `NEW-COMPUTER-MIGRATION.md` for detailed analysis
4. Ensure SSH keys and configuration are properly restored

**Remember**: This repository contains educational content. Zero data loss is the goal!