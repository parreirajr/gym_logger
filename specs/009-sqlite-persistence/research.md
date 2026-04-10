# Phase 0: Outline & Research

## Decision 1: SQLite Library
- **Decision**: Use the `sqflite` package alongside `path`.
- **Rationale**: Industry standard for Flutter local relational databases, officially maintained, and highly tested. The `path` library safely composes correct file paths across different operating systems.
- **Alternatives**: Hive, Isar, shared_preferences. Rejected because the feature spec strictly defines `sqflite` usage.

## Decision 2: ID Field Data Type
- **Decision**: Keep the `id` field as a `TEXT` storing string UUIDs.
- **Rationale**: The current `Workout` model leverages UUID for its identification. Continuing with string UUIDs prevents breaking model compatibility and allows for offline-first synchronization capabilities in the future.
- **Alternatives**: Using `INTEGER PRIMARY KEY AUTOINCREMENT`. Rejected to maintain domain model consistency.

## Decision 3: Repository Pattern
- **Decision**: Implement a `WorkoutRepository` interface and class.
- **Rationale**: Crucial for Layered Architecture. It fully abstracts the UI from understanding any SQLite specific implementations (like maps and cursors), returning lists of typed `Workout` models.
- **Alternatives**: Directly initializing `DatabaseHelper` in `HomePage`. Rejected because it leaks database logic into the Presentation Layer.

## Decision 4: Asynchronous Pattern
- **Decision**: Use `async/await` explicitly.
- **Rationale**: Mandated by FR-008 and necessary due to the asynchronous nature of file system database calls in Flutter.
- **Alternatives**: `Future.then` chains. Rejected as they are harder to read and debug compared to `async/await`.
