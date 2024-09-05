#!/bin/bash

# Define arrays of parameters
inputs=("/home/HTML_GITHUB/cd03.txt" "/home/HTML_GITHUB/cd04.txt" "/home/HTML_GITHUB/cd05.txt")
outputs=("/home/HTML_GITHUB/output1.html" "/home/HTML_GITHUB/output2.html" "/home/HTML_GITHUB/output3.html")

# Ensure the same number of inputs and outputs
if [ ${#inputs[@]} -ne ${#outputs[@]} ]; then
    echo "The number of input files and output files must match."
    exit 1
fi

# Loop through arrays
for i in "${!inputs[@]}"; do
    input="${inputs[$i]}"
    output="${outputs[$i]}"

    # Run the script with current parameters
    #./your_script.sh "$input" "$output"

    echo "Processed $input -> $output"
done
