# MATH 252 - Calculus II Summer 2025 (Private Source)

This is the private source repository for MATH 252 Calculus II Summer 2025, containing course development materials, metadata, and management files.

## Dual Repository Architecture

This course follows a dual-repository pattern:
- **Private Source:** [MATH_252-2025_summer](https://github.com/jjohnson-47/MATH_252-2025_summer) (this repo)
- **Public Assets:** [MATH_252-assets](https://github.com/jjohnson-47/MATH_252-assets) (submodule)

## Directory Structure

- `assets/` - Git submodule linking to public assets repository
- `course-documents/` - Course metadata and private documentation  
- `docs/` - Private course development documentation
- `templates/` - Content creation templates
- `weekly-modules/` - Module metadata and structure
- `welcome-module/` - Course introduction structure

## Course Information

**Course:** MATH A252 Calculus II  
**Format:** Summer 2025 intensive  
**Technology:** Blackboard Ultra integration  
**Content:** Interactive web-based learning materials

**Topics Covered:**
- Integration (Chapter 5)
- Techniques of Antidifferentiation (Chapter 6) 
- Applications of Integration (Chapter 7)
- Sequences and Series (Chapter 9)
- Curves in the Plane (Chapter 10)

## Development Workflow

1. Content development in private repository
2. Public assets automatically deployed via GitHub Pages
3. Blackboard Ultra integration via iframe embedding
4. Automated CI/CD for content validation

**Live Assets URL:** https://jjohnson-47.github.io/MATH_252-assets/