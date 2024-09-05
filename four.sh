#!/bin/bash

# Path to the directory containing the text files
INPUT_DIR="/home/HTML_GITHUB/"
# Path to the directory where the output HTML files will be saved
OUTPUT_DIR="/home/HTML_GITHUB/html_files"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through each text file in the input directory
for INPUT_FILE in "$INPUT_DIR"/*.txt; do
  # Extract the base name of the file (without directory and extension)
  BASE_NAME=$(basename "$INPUT_FILE" .txt)
  # Define the output HTML file path
  OUTPUT_FILE="$OUTPUT_DIR/${BASE_NAME}.html"

  # Check if the input file exists
  if [ ! -f "$INPUT_FILE" ]; then
    echo "Input file $INPUT_FILE not found!" >&2
    continue
  fi

  # Start the HTML content
  {
    echo "<!DOCTYPE html>"
    echo "<html lang=\"en\">"
    echo "<head>"
    echo "    <meta charset=\"UTF-8\">"
    echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
    echo "    <title>${BASE_NAME} - File Content</title>"
    echo "    <style>"
    echo "        body { font-family: Arial, sans-serif; margin: 20px; }"
    echo "        .line { margin: 0; padding: 5px; border-bottom: 1px solid #ddd; }"
    echo "    </style>"
    echo "</head>"
    echo "<body>"
    echo "    <h1>${BASE_NAME} - File Content</h1>"

    # Read each line of the input file and wrap it in <p> tags
    while IFS= read -r line; do
      echo "    <p class=\"line\">${line}</p>"
    done < "$INPUT_FILE"

    # Finish the HTML content
    echo "</body>"
    echo "</html>"
  } > "$OUTPUT_FILE"

  echo "HTML file generated at $OUTPUT_FILE"
done

