# Quickstart: UI Atomic Design Refactor

This guide explains how to integrate the new Atomic Design components into the Gym Logger project.

## Directory Structure
The presentation layer has been fully partitioned:
```
lib/presentation/
├── atoms/          # Basic building blocks (Text, Buttons, Fields)
├── molecules/      # Small groupings of atoms (Rows, Field Groups)
├── organisms/      # Complex components handling their internal layout (Forms, Cards)
└── pages/          # Full-screen routes orchestrating Organisms
```

## Creating a new Screen
1. **Never write raw `Container` or `Text` widgets** directly in your `Page` widget.
2. Build the basic layout using `organisms`.
3. If an organism is missing a piece of data, either pass it via a molecule to the organism, or update the organism.
4. Route to the new page using standard Navigator 1.0 named routes.

## Development Constraints
- **Atoms and Molecules** must never possess business logic or `Navigator` calls.
- **State Management**: Local state using `StatefulWidget` is permitted, primarily inside Organisms and Pages. Do not use external stores.
- **Theming**: Components must strictly use the unified project theme (Dark Mode: #121212 bg, #1E1E1E surfaces).

## Testing
Always update or write a Widget Test when assembling a new organism or page to ensure the composed atoms properly display properties without overflow.
