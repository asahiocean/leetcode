#! /bin/bash

# 192. Word Frequency
# https://leetcode.com/problems/word-frequency/

cat words.txt | xargs -n 1 | sort | uniq -c | sort -nr | awk '{print $2 " " $1}'