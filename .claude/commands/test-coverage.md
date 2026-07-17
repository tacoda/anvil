# /test-coverage

Analyze current test coverage and generate tests for uncovered code paths.

## Steps

1. Run `[npm test -- --coverage]` and review the coverage report.
2. Identify files and functions below `[80%]` coverage.
3. For each uncovered code path:
   - Understand what the code does.
   - Write a test that exercises that path.
   - Include edge cases and error conditions.
4. Run the tests and fix any failures.
5. Re-run coverage to confirm improvement.

## Output

- Starting coverage percentage.
- Number of new tests written.
- Any bugs discovered while testing.
- Final coverage percentage.
