#!/bin/bash

# create-backup.sh - Complete backup script for math252-summer repository
# This script creates a comprehensive backup including ALL content (tracked and untracked)

set -e  # Exit on any error

# Configuration
REPO_DIR="/home/verlyn13/Projects/math252-summer"
BACKUP_DATE=$(date +"%Y%m%d_%H%M%S")
BACKUP_BASE="math252-summer-backup-${BACKUP_DATE}"
BACKUP_DIR="${HOME}/Desktop/${BACKUP_BASE}"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Starting complete backup of math252-summer repository${NC}"
echo -e "${BLUE}📅 Backup timestamp: ${BACKUP_DATE}${NC}"
echo -e "${BLUE}📁 Backup location: ${BACKUP_DIR}${NC}"
echo

# Create backup directory
echo -e "${YELLOW}📂 Creating backup directory...${NC}"
mkdir -p "${BACKUP_DIR}"

# Change to repository directory
cd "${REPO_DIR}"

# 1. Complete directory backup (including all untracked files)
echo -e "${YELLOW}📋 Creating complete directory backup...${NC}"
echo "   Including all tracked and untracked content"
rsync -av \
    --exclude='.git' \
    --exclude='.claude/settings.local.json' \
    . "${BACKUP_DIR}/complete-repo/"

echo -e "${GREEN}✅ Complete directory backup created${NC}"

# 2. Git repository backup (bare clone for complete history)
echo -e "${YELLOW}🔄 Creating git repository backup...${NC}"
git clone --bare . "${BACKUP_DIR}/git-repo.git"
echo -e "${GREEN}✅ Git repository backup created${NC}"

# 3. Configuration files backup
echo -e "${YELLOW}⚙️  Backing up configuration files...${NC}"
mkdir -p "${BACKUP_DIR}/config"

# Git configuration
cp .git/config "${BACKUP_DIR}/config/git-config"

# Claude settings (if exists)
if [ -f ".claude/settings.local.json" ]; then
    cp .claude/settings.local.json "${BACKUP_DIR}/config/claude-settings.json"
fi

# SSH configuration (from system)
if [ -f "${HOME}/.ssh/config" ]; then
    cp "${HOME}/.ssh/config" "${BACKUP_DIR}/config/ssh-config"
fi

echo -e "${GREEN}✅ Configuration files backed up${NC}"

# 4. Create detailed inventory
echo -e "${YELLOW}📊 Creating detailed file inventory...${NC}"
cat > "${BACKUP_DIR}/BACKUP_INVENTORY.txt" << EOF
MATH252-SUMMER REPOSITORY BACKUP INVENTORY
==========================================
Backup Date: $(date)
Original Path: ${REPO_DIR}
Backup Location: ${BACKUP_DIR}

REPOSITORY STATISTICS:
Total Size: $(du -sh . | cut -f1)
Git-tracked files: $(git ls-files | wc -l)
Untracked files: $(git ls-files --others --exclude-standard | wc -l)

CRITICAL UNTRACKED CONTENT:
$(find . -name "*.pdf" -o -name "*.png" -o -name "*.jpg" -o -name "*.svg" | grep -v ".git" | head -20)

DIRECTORY SIZES:
$(du -sh */ 2>/dev/null | sort -hr)

LARGE FILES (>100KB):
$(find . -type f -size +100k | grep -v ".git" | xargs ls -lh | awk '{print $5 " " $9}')

GIT STATUS:
$(git status --porcelain)

GIT REMOTES:
$(git remote -v)

RECENT COMMITS:
$(git log --oneline -5)
EOF

echo -e "${GREEN}✅ Inventory created${NC}"

# 5. Create verification script
echo -e "${YELLOW}🔍 Creating verification script...${NC}"
cat > "${BACKUP_DIR}/verify-backup.sh" << 'EOF'
#!/bin/bash

# verify-backup.sh - Verify backup integrity
echo "🔍 Verifying math252-summer backup..."

BACKUP_DIR="$(dirname "$0")"
cd "${BACKUP_DIR}"

echo "📂 Checking backup structure..."
if [ -d "complete-repo" ] && [ -d "git-repo.git" ] && [ -d "config" ]; then
    echo "✅ All backup directories present"
else
    echo "❌ Missing backup directories!"
    exit 1
fi

echo "📊 Checking file counts..."
ORIGINAL_FILES=$(grep "Git-tracked files:" BACKUP_INVENTORY.txt | awk '{print $3}')
BACKUP_FILES=$(find complete-repo -type f | wc -l)
echo "   Original tracked files: ${ORIGINAL_FILES}"
echo "   Backup files: ${BACKUP_FILES}"

echo "🔍 Checking critical content..."
if [ -d "complete-repo/staging" ]; then
    echo "✅ Staging directory present"
    STAGING_SIZE=$(du -sh complete-repo/staging | cut -f1)
    echo "   Staging size: ${STAGING_SIZE}"
else
    echo "❌ Staging directory missing!"
fi

if [ -d "complete-repo/migrate" ]; then
    echo "✅ Migrate directory present"
    MIGRATE_SIZE=$(du -sh complete-repo/migrate | cut -f1)
    echo "   Migrate size: ${MIGRATE_SIZE}"
else
    echo "❌ Migrate directory missing!"
fi

echo "🔍 Checking large files..."
LARGE_FILES=$(find complete-repo -name "sec5-5-q4.png")
if [ -n "${LARGE_FILES}" ]; then
    echo "✅ Critical large files found:"
    echo "${LARGE_FILES}"
else
    echo "❌ Critical large files missing!"
fi

echo "✅ Backup verification complete"
EOF

chmod +x "${BACKUP_DIR}/verify-backup.sh"
echo -e "${GREEN}✅ Verification script created${NC}"

# 6. Create compression option
echo -e "${YELLOW}📦 Creating compressed archive...${NC}"
cd "$(dirname "${BACKUP_DIR}")"
tar -czf "${BACKUP_BASE}.tar.gz" "${BACKUP_BASE}/"
echo -e "${GREEN}✅ Compressed archive created: ${BACKUP_BASE}.tar.gz${NC}"

# 7. Final summary
echo
echo -e "${GREEN}🎉 BACKUP COMPLETE!${NC}"
echo -e "${BLUE}📁 Backup location: ${BACKUP_DIR}${NC}"
echo -e "${BLUE}📦 Compressed: ${BACKUP_BASE}.tar.gz${NC}"
echo
echo -e "${YELLOW}📋 Backup contents:${NC}"
echo "   • complete-repo/ - Full directory with all files"
echo "   • git-repo.git/ - Bare git repository"
echo "   • config/ - Git and development configurations"
echo "   • BACKUP_INVENTORY.txt - Detailed file listing"
echo "   • verify-backup.sh - Backup verification script"
echo
echo -e "${YELLOW}🔍 To verify backup:${NC}"
echo "   cd '${BACKUP_DIR}' && ./verify-backup.sh"
echo
echo -e "${YELLOW}💾 Total backup size:${NC}"
du -sh "${BACKUP_DIR}"
echo
echo -e "${GREEN}✅ Ready for transfer to new computer!${NC}"