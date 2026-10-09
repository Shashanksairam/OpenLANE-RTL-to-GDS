# Troubleshooting Log

Record every error you hit and how you fixed it. This is the most valuable section for anyone repeating the flow, and it shows real debugging ability.

| Date | Stage | Symptom / error message | Cause | Fix |
|------|-------|-------------------------|-------|-----|
| _yyyy-mm-dd_ | _e.g. synthesis_ | _paste the exact error_ | _what was wrong_ | _what you changed_ |

## Common problem patterns to watch for
- **Docker permission errors**: user not in the `docker` group.
- **Wrong tag / overwrite**: forgetting `-overwrite` and reusing an old run directory.
- **Missing extra LEF**: custom cell not visible to the flow because its LEF was not added before synthesis/floorplan.
- **Liberty mismatch**: synthesis uses a different `.lib` than STA, giving inconsistent numbers.
- **Negative slack after CTS**: expected on first pass; investigate buffers and corner before panicking.
