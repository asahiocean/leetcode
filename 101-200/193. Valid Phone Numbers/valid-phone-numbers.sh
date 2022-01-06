#!/bin/bash

# 193. Valid Phone Numbers
# https://leetcode.com/problems/valid-phone-numbers/

# Read from the file file.txt and output all valid phone numbers to stdout.
sed -nr '/(^[0-9]{3}-|^\([0-9]{3}\)\s)[0-9]{3}-[0-9]{4}$/p' file.txt

# Solution 2:
# grep -E '^\([0-9]{3}\)\s[0-9]{3}-[0-9]{4}$|^[0-9]{3}-[0-9]{3}-[0-9]{4}$' file.txt

# Solution 3
# awk '/^([0-9]{3}-|\([0-9]{3}\) )[0-9]{3}-[0-9]{4}$/' file.txt