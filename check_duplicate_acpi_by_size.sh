#!/usr/bin/env bash
echo "Files found with the same file size:"

# 1. ignore the "total" line
# 2. sort by file size
# 3. print _both lines_ where files are same size whenever it's same as last
# 4. remove duplicates (by file name) from "both lines" logic in awk command

ls -l origin \
	| tail -n +2 \
	| sort -k 5,5 \
	| awk '{ if ( $5==size ) { print $0; print last }; size=$5; last=$0 }' \
	| sort -k 9,9 -u
