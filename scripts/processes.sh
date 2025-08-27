#!/bin/bash

set -euo pipefail
# -e: exit if command fails
# -u: error on unset variables
# -o pipefail: fail a pipeline if any part fails


echo "=== Top 10 Processes (ps aux) ==="
# ps aux: list all processes with user, cpu%, mem%, etc.
# --sort=-%cpu: sort descending by CPU usage
# head -n 11: show 1 header row and 10 processes
ps aux --sort=-%cpu | head -n 11
echo

echo "=== top (batch mode, single snapshot) ==="
# top is in batch mode (-b) for non-interactive output
# -n 1 takes a snapshot then exits; pipe to head for readability
if command -v top >/dev/null 2>&1; then
	top -b -n 1 | head -n 25
else
	echo "top not found on PATH"
fi
echo

echo "=== htop (5 seconds) ==="
if command -v htop >/dev/null 2>&1; then
	htop --version 2>/dev/null | head -n 1 || true

	if command -v timeout >/dev/null 2>&1; then
		timeout 5 htop || true
	else
	echo "Timeout was not found.  Install coreutils or press q to exit htop"

	fi
else
	echo "htop not installed.  Install: sudo apt update && sudo apt install -y htop"
fi
echo "That is all!"
chmod +x processes.sh
