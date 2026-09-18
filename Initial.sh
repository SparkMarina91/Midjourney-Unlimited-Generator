#!/bin/sh

TARGET="${1:-.}"

echo "Project Analyzer"
echo "================"
echo "Target: $TARGET"
echo

files=$(find "$TARGET" -type f 2>/dev/null)
directories=$(find "$TARGET" -type d 2>/dev/null)

file_count=$(printf "%s\n" "$files" | sed '/^$/d' | wc -l)
directory_count=$(printf "%s\n" "$directories" | sed '/^$/d' | wc -l)

shell_count=$(find "$TARGET" -type f -name "*.sh" 2>/dev/null | wc -l)
python_count=$(find "$TARGET" -type f -name "*.py" 2>/dev/null | wc -l)
cpp_count=$(find "$TARGET" -type f -name "*.cpp" 2>/dev/null | wc -l)
html_count=$(find "$TARGET" -type f -name "*.html" 2>/dev/null | wc -l)

echo "Files: $file_count"
echo "Directories: $directory_count"
echo
echo "File Types"
echo "----------"
echo "Shell: $shell_count"
echo "Python: $python_count"
echo "C++: $cpp_count"
echo "HTML: $html_count"

echo
echo "Largest Files"
echo "-------------"

find "$TARGET" -type f -exec du -k {} + 2>/dev/null |
    sort -nr |
    head -n 5

echo
echo "Analysis completed."