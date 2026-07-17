# /scaffold $ARGUMENTS

Generate a new feature module with implementation and test files, matching the
existing codebase patterns.

The feature name is provided as: $ARGUMENTS

## Steps

1. Read an existing reference file (`[src/reference-module.ts]`) to learn the
   current patterns: structure, error handling, types, storage.
2. Create the implementation file at `[src/$ARGUMENTS.ts]` that:
   - [Exports the expected interface, e.g. an Express Router]
   - [Includes the standard operations, e.g. list, get-by-id, create, update, delete]
   - Uses the same error-handling pattern as the reference.
   - Includes type definitions for the resource.
   - Matches the existing storage/data pattern.
3. Create a test file at `[src/$ARGUMENTS.test.ts]` that:
   - Tests all operations.
   - Tests error cases ([404, 400]).
   - Uses the existing test framework and helpers.
4. Show how to wire the new module in (but don't modify the entry point automatically).

## Success Criteria

- New files follow the exact patterns from the existing codebase.
- Tests pass when run with `[npm test]`.
- Compiles / type-checks without errors.
