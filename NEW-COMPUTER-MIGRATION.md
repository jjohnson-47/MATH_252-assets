# NEW-COMPUTER-MIGRATION.md

## Repository Migration Guide for math252-summer

This document provides a comprehensive strategy for migrating the `math252-summer` Calculus 2 course repository to a new computer without losing any content.

## Repository Overview

- **Type**: Calculus 2 course content management system for Blackboard Ultra
- **Total Size**: ~13MB
- **Primary Function**: Static content authoring with GitHub-based version control
- **Critical Content**: Course materials, examples, templates, staging files, and educational resources

## Repository Structure Analysis

### Git-Tracked Content (11.5MB)
- `/docs/` - 488KB - Documentation and examples from previous semesters
- `/weekly-modules/` - 4KB - Main course content workspace
- `/welcome-module/` - 4KB - Course introduction module
- `/course-documents/` - 4KB - Syllabus, schedule, core documents
- `/templates/` - 12KB - Reusable content templates
- `/images/` - 48KB - Course visual assets
- `/links/` - 4KB - External resource references

### Untracked Content (1.5MB) - **CRITICAL TO BACKUP**
- `/staging/` - 3.7MB - **Large untracked files including:**
  - `Math_252___Simpson_s_Rule_Section_5_5_Question_4.pdf` (240KB)
  - `sec5-5-q4.png` (3.4MB) - **LARGEST FILE**
  - `region4.png` (16KB)
  - SVG diagrams: `fig-6-4-3.svg`, `fig-6-4-4.svg`, `fig-6-4-5.svg`
  - LaTeX homework file: `homework-sec-5-5-question-4.tex`
- `/migrate/` - 7.4MB - **Contains separate repository structure**
  - Separate git repository with different remotes
  - May contain educational content not in main repo
- **Untracked files in root:**
  - `FILE_DESCRIPTIONS.md`
  - `course-makeover.md`  
  - `stat253-README.md`

### Configuration Files
- `.claude/settings.local.json` - Claude Code local settings
- `.git/config` - Git configuration with SSH key setup for `github-work:jjohnson-47/math252-summer.git`

## Critical Migration Considerations

### 🚨 HIGH PRIORITY - Don't Lose These
1. **`/staging/` directory** - Contains large educational images and PDFs not in git
2. **`/migrate/MATH_252/` structure** - Appears to be separate repository with its own content
3. **SSH key configuration** - Repository uses custom SSH key (`github-work:` prefix)
4. **Local Claude settings** - `.claude/settings.local.json` for development environment

### Large Files Alert
- `sec5-5-q4.png` (3.4MB) - Located in both `/staging/` and `/migrate/MATH_252/assets/images/chapter5/`
- This suggests the `/migrate/` directory may be a backup or alternative organization

## Migration Strategy

### Phase 1: Complete Backup
1. **Full directory backup** including all untracked content
2. **Git repository backup** preserving all branches and history
3. **SSH key backup** to maintain repository access
4. **Configuration backup** for development environment

### Phase 2: Verification
1. **Size verification** - Confirm 13MB total transfer
2. **File count verification** - Ensure all educational content transferred
3. **Git integrity check** - Verify repository history and remotes
4. **Large file verification** - Confirm all staging content present

### Phase 3: New Computer Setup
1. **SSH key restoration** for GitHub access
2. **Git configuration** with proper user settings
3. **Directory structure recreation** preserving file permissions
4. **Development environment setup** including Claude Code settings

## Repository Configuration Details

- **Git Remote**: `github-work:jjohnson-47/math252-summer.git`
- **Main Branch**: `main`
- **User**: `jjohnson-47 <jjohnson47@alaska.edu>`
- **SSH Key Required**: Custom SSH configuration (`github-work` prefix indicates special key)
- **No Submodules**: Repository is standalone
- **No Build Process**: Static content only, no package.json or build tools

## What's NOT in Git (Must be manually backed up)

1. **`/staging/` directory** (3.7MB)
   - Educational PDFs and large images
   - LaTeX source files
   - Course material diagrams

2. **Root-level documentation files**
   - `FILE_DESCRIPTIONS.md`
   - `course-makeover.md`
   - `stat253-README.md`

3. **`/migrate/` directory** (7.4MB)
   - May contain separate course repository
   - Alternative organization structure
   - Potentially important educational content

4. **Claude Code settings**
   - `.claude/settings.local.json`

## File Size Breakdown

```
Total Repository: ~13MB
├── Git-tracked content: ~11.5MB
├── /staging/: 3.7MB (untracked)
├── /migrate/: 7.4MB (untracked)
├── Untracked docs: <1MB
└── Config files: <1MB
```

## Next Steps

1. Run the generated `create-backup.sh` script to create complete backup
2. Transfer backup files to new computer
3. Follow `NEW-COMPUTER-SETUP.md` for restoration process
4. Verify all content transferred successfully using provided verification commands

## Educational Content Priority

This is a course repository containing educational materials. Ensure ALL content in `/staging/` and `/migrate/` directories is preserved, as these likely contain:
- Student homework problems
- Course diagrams and visualizations  
- Reference materials
- Alternative course organizations

**Zero data loss tolerance** - Educational content is irreplaceable.