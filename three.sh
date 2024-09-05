#!/bin/bash

# Define the input directory containing the text files and the output directory for HTML files
input_dir="/home/HTML_GITHUB"
output_dir="/home/HTML_GITHUB"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Iterate over each text file in the input directory
for text_file in "$input_dir"/*.txt; do
    # Get the base name of the file (e.g., file.txt becomes file)
    base_name=$(basename "$text_file" .txt)
    
    # Read each line from the text file
    while IFS= read -r line; do
        # Generate the HTML file name based on the line number
        line_number=$(grep -nFx "$line" "$text_file" | cut -d: -f1)
        html_file="$output_dir/${base_name}_line${line_number}.html"
        
        # Write the HTML content to the file
        echo "<html>" > "$html_file"
        echo "<head><title>${base_name} - Line ${line_number}</title></head>" >> "$html_file"
        echo "<body>" >> "$html_file"
        echo "<p>${line}</p>" >> "$html_file"
        echo "</body>" >> "$html_file"
        echo "</html>" >> "$html_file"
    done < "$text_file"
done

echo "Conversion completed."

