#!/bin/bash

# 195. Tenth Line
# https://leetcode.com/problems/tenth-line/

# Read from the file file.txt and output the tenth line to stdout.
sed -n '10p' < file.txt
