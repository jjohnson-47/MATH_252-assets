# Calculus 2 Course - GitHub Project Structure

## Project Structure

```
calculus2-course/
│
├── README.md                    # Project overview and quick start guide
├── course-setup-guide.md        # Detailed documentation for Blackboard setup
│
├── introduction-module/         # Force sequenced intro module
│   ├── 1-blackboard-essentials/
│   │   ├── content.html         # Main content
│   │   └── metadata.json        # Settings (visibility, sequencing)
│   ├── 2-technology-troubleshooting/
│   │   ├── content.html
│   │   └── metadata.json
│   ├── ...and so on for all 8 introduction items
│   └── module-description.txt   # Module description text (≤700 chars)
│
├── course-documents/            # Non-sequenced documents module
│   ├── syllabus/
│   │   ├── syllabus.html        # Web friendly version
│   │   ├── syllabus.gdoc        # Reference to Google Doc version
│   │   └── metadata.json
│   ├── schedule/
│   │   ├── schedule.html        # Web friendly version
│   │   ├── schedule.gdoc        # Reference to Google Doc version
│   │   └── metadata.json
│   └── module-description.txt   # Module description text
│
├── weekly-modules/              # Course content by week
│   ├── week1/                   # Force sequenced weekly module
│   │   ├── 1-module-introduction/
│   │   │   ├── content.html
│   │   │   └── metadata.json    # Release conditions: Monday 7AM
│   │   ├── 2-questions-introductions/
│   │   │   ├── content.html     # Discussion prompt
│   │   │   └── metadata.json    # Requires: View Module Intro
│   │   ├── 3-overview-video/
│   │   │   ├── content.html     # Video embed
│   │   │   └── metadata.json    # Requires: Post in Discussion
│   │   ├── 4-section1-content/
│   │   │   ├── content.html     # Section 1 readings/materials
│   │   │   └── metadata.json    # Requires: Watch Overview Video
│   │   ├── ...remaining items following the sequence
│   │   └── module-description.txt
│   ├── week2/
│   │   └── ...same structure as week1
│   └── ...remaining weeks
│
└── templates/                   # Reusable components
    ├── module-template/         # Base structure for new weekly modules
    ├── content-templates/       # HTML snippets for common content types
    │   ├── video-embed.html
    │   ├── practice-problems.html
    │   └── ...other templates
    └── description-templates.txt # Common folder descriptions
```

## Metadata Format (JSON)

Each content item will have a `metadata.json` file with this structure:

```json
{
  "title": "Module Introduction",
  "content_type": "document",  // folder, document, link, test, assignment, discussion
  "visibility": "visible",     // visible, hidden
  "release_condition": {
    "type": "date",           // date, performance, none
    "date": "2025-01-06T07:00:00", // if type is date
    "performance": {          // if type is performance
      "prerequisite_item": "Previous Item Title",
      "criterion": "view",    // view, submit, score
      "score_threshold": null // if criterion is score
    }
  },
  "description": "Welcome to Week 1 of Calculus 2! In this module, we'll explore antiderivatives and the definite integral. 📊 Start with the introduction, then post in the discussion before accessing this week's materials."
}
```

## Documentation Aid (`course-setup-guide.md`)

Here's a sample of the documentation aid:

```markdown
# Blackboard Ultra Course Setup Guide

## Step 1: Creating Modules with Forced Sequencing

1. In Blackboard Ultra, navigate to Course Content
2. Click "Create" > "Learning Module"
3. Name it according to your GitHub folder (e.g., "Week 1: Foundations of Integration")
4. Set dates to match metadata.json (e.g., Visible Jan 6 - Jan 12)
5. Toggle ON "Advance in sequence ▶ Forced sequence"
6. Copy module description from module-description.txt

## Step 2: Adding Content Items

For each subfolder in your GitHub week folder:

1. Click "+" within your module
2. Select content type matching metadata.json (document, discussion, etc.)
3. Copy title from metadata.json
4. For HTML content:
   - Select "Document"
   - Copy HTML content from content.html
   - Click the </> HTML button to paste
5. Set release conditions from metadata.json:
   - Click the eye icon > "Release conditions"
   - Set according to the type in metadata.json

## Troubleshooting Tips

- If a sequence breaks, check that all prior items are visible
- Test with Student Preview to verify the entire sequence works
- For videos, ensure the "Performance → Student has viewed media" condition is set

## Quick Reference: Content Types

| GitHub Content Type | Blackboard Selection |
|---------------------|----------------------|
| document            | Document (HTML)      |
| link                | Link                 |
| discussion          | Discussion           |
| assignment          | Assignment           |
| test                | Test                 |
```

## Module Description Template Example

```
📊 Week 1: Foundations of Integration and Definite Integrals 🔒

This module introduces fundamental integration concepts, exploring antiderivatives, indefinite integration, and the definite integral (Sections 5.1-5.2). We'll learn how to find antiderivatives and calculate areas under curves. Complete each item in sequence to unlock the next.
```

## Benefits of This Structure

1. **Maintainability**: Each content item is isolated in its own folder with clear metadata
2. **Consistency**: Templates ensure uniform structure across modules
3. **Documentation**: Clear setup guide makes Blackboard implementation straightforward
4. **Version Control**: GitHub lets you track changes over semesters
5. **Collaboration**: Easy to share with other instructors or TAs

