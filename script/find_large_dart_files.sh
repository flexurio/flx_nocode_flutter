#!/bin/bash

# Find all .dart files, excluding *.freezed.dart and *.g.dart, and check if they have more than 500 lines
find . -name "*.dart" ! -name "*.freezed.dart" ! -name "*.g.dart" | while read file; do
    # Count the lines in the file
    line_count=$(wc -l < "$file")
    
    # If the file has more than 900 lines, print its name
    if [ "$line_count" -gt 900 ]; then
        echo "$file has $line_count lines"
    fi
done
