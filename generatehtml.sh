#!/bin/bash

# Paths to the input text file and the output HTML file
INPUT_FILE="/home/HTML_GITHUB/cd03.txt"
OUTPUT_FILE="/home/HTML_GITHUB/OUTPUT.html"

# Check if the input file exists
if [ ! -f "$INPUT_FILE" ]; then
  echo "Input file not found!" >&2
  exit 1
fi

# Start the HTML content
{
  echo "<!DOCTYPE html>"
  echo "<html lang=\"en\">"
  echo "<head>"
  echo "    <meta charset=\"UTF-8\">"
  echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
  echo "    <title>File Content</title>"
  echo "    <style>"
  echo "        body { font-family: Arial, sans-serif; }"
  echo "        .line { margin: 0; padding: 5px; }"
  echo "    </style>"
  echo "</head>"
  echo "<body>"
  echo "    <h1>File Content</h1>"

  # Read each line of the input file and wrap it in <p> tags
  while IFS= read -r line; do
    echo "    <p class=\"line\">${line}</p>"
  done < "$INPUT_FILE"

  # Finish the HTML content
  echo "</body>"
  echo "</html>"
} > "$OUTPUT_FILE"

echo "HTML file generated at $OUTPUT_FILE"

