#!/bin/bash

ip a | grep -E "inet" 		# Show IPs
ping -c 2 8.8.8.8		# See if you can reach another IP address
curl -I https://example.com	# Fetch only HTTP headers
ss -tulpen | head		# Show listening sockets/ports
