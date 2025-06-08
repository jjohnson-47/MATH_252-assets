# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Calculus 2 course content management system** for Blackboard Ultra integration. The repository serves as a GitHub-based content authoring system for MATH A252 summer course materials, providing structured HTML content with metadata for systematic LMS import.

## Development Workflow

### No Build Process
- This is a **static content authoring system** with no build tools, package.json, or compilation
- Content is created and edited manually using templates and examples
- Version control via Git only - no CI/CD or deployment automation

### Content Creation Process
1. Copy structure from `/templates/module-template/` for new weekly modules
2. Customize `content.html` using examples from `/docs/examples/spring2025/`
3. Configure `metadata.json` with appropriate Blackboard settings
4. Write `module-description.txt` following 700-character limit
5. Reference existing examples for consistency

## Architecture

### Directory Structure
- `/weekly-modules/` - Main course content organized by week (primary workspace)
- `/welcome-module/` - Course introduction module
- `/course-documents/` - Syllabus, schedule, and core documents
- `/templates/` - Reusable templates for content creation
- `/docs/examples/` - Previous semester implementations for reference
- `/images/` - Course visual assets
- `/links/` - External resource references

### Content Item Structure
Each content item follows this pattern:
```
content-folder/
├── content.html         # Main HTML content with embedded CSS
├── metadata.json        # Blackboard configuration
└── module-description.txt # Brief description (≤700 chars)
```

### Metadata Configuration
Key metadata.json structure for Blackboard:
```json
{
  "title": "Content Title",
  "content_type": "document|link|discussion|test|assignment", 
  "visibility": "visible|hidden",
  "release_condition": {
    "type": "date|performance|none",
    "date": "2025-MM-DDTHH:mm:ss",
    "performance": {
      "prerequisite_item": "Previous Item",
      "criterion": "view|submit|score"
    }
  }
}
```

## Content Standards

### HTML Conventions
- **Embedded CSS** in each file for Blackboard portability
- **MathJax integration** via CDN for mathematical notation
- **Responsive design** with mobile-friendly layouts
- **Accessibility features** including reduced motion support
- **Professional retrowave/synthwave theme** with consistent color scheme

### Content Guidelines
- **Professional academic tone** appropriate for higher education
- **700-character limit** for module descriptions
- **Minimal emoji usage** - professional icons only
- **APEX Calculus textbook integration** with consistent linking patterns
- **Blackboard-first design** - all content optimized for LMS display

### Course Structure
5-unit progression covering:
1. Integration (Chapter 5)
2. Techniques of Antidifferentiation (Chapter 6)
3. Applications of Integration (Chapter 7) 
4. Sequences and Series (Chapter 9)
5. Curves in the Plane (Chapter 10)

## Working with Templates

### Available Templates
- `/templates/content-templates/video-embed.html` - Video integration
- `/templates/content-templates/practice-problems.html` - Problem sets
- `/templates/description-templates.txt` - Standardized descriptions
- `/templates/module-template/` - Base weekly module structure

### Example Reference
Use `/docs/examples/spring2025/` extensively:
- Complete weekly module implementations
- Section overview patterns
- Homework and discussion structures
- Tool integrations (Desmos, Colab, calculators)

## File Naming Conventions

### Module Organization
- Weekly modules: `01-week1module/`, `02-week2module/`
- Sequential numbering within modules: `1-module-introduction/`, `2-discussion/`
- Descriptive content names: `sec-5-1-overview.html`, `riemann-sum-calculator.html`

### Content Types
- `overview.html` - Section introductions
- `textbook-overview.md` - Reading guides  
- `*-calculator.html` - Interactive tools
- `*-description.txt` - Module descriptions
- `written-homework-*.txt` - Assignment specifications

## Common Development Tasks

### Creating New Weekly Module
1. `cp -r templates/module-template/ weekly-modules/[##]-week[#]module/`
2. Update folder names and content based on examples
3. Customize metadata.json release conditions
4. Write module-description.txt following existing patterns

### Adding Content Item
1. Create folder with descriptive name
2. Copy relevant template from `/templates/content-templates/`
3. Configure metadata.json for Blackboard integration
4. Test HTML content display and MathJax rendering

### Maintaining Consistency
- Reference `/docs/examples/spring2025/` for established patterns
- Follow embedded CSS conventions from existing files
- Maintain professional tone and 700-char description limits
- Use consistent release condition patterns in metadata