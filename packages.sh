#!/bin/bash

sudo apt -y install jq tree	# Handy CLI Tools
jq --version			# See what version is installed, if any
tree ~ | head			# Print home directory as a tree
