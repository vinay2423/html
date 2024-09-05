#!/bin/bash

# Array of scripts
SCRIPTS=("/home/HTML_GITHUB/generatehtml.sh/" "/home/HTML_GITHUB/mtabsHTML.sh" )
OUTPUT_FILE="/home/HTML_GITHUB/one.html"

# Start the HTML content
{
  echo "<!DOCTYPE html>"
  echo "<html lang=\"en\">"
  echo "<head>"
  echo "    <meta charset=\"UTF-8\">"
  echo "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">"
  echo "    <title>Scripts Output in Tabs</title>"
  echo "    <style>"
  echo "        body { font-family: Arial, sans-serif; margin: 20px; }"
  echo "        .tab-container { overflow: hidden; border: 1px solid #ddd; }"
  echo "        .tab { float: left; padding: 10px 20px; cursor: pointer; border: 1px solid #ddd; }"
  echo "        .tab-content { display: none; padding: 20px; border-top: 1px solid #ddd; }"
  echo "        .active-tab { background-color: #f1f1f1; }"
  echo "        .show { display: block; }"
  echo "    </style>"
  echo "    <script>"
  echo "        function openTab(event, tabId) {"
  echo "            var i, tabcontent, tablinks;"
  echo "            tabcontent = document.getElementsByClassName('tab-content');"
  echo "            for (i = 0; i < tabcontent.length; i++) {"
  echo "                tabcontent[i].style.display = 'none';"
  echo "            }"
  echo "            tablinks = document.getElementsByClassName('tab');"
  echo "            for (i = 0; i < tablinks.length; i++) {"
  echo "                tablinks[i].className = tablinks[i].className.replace(' active-tab', '');"
  echo "            }"
  echo "            document.getElementById(tabId).style.display = 'block';"
  echo "            event.currentTarget.className += ' active-tab';"
  echo "        }"
  echo "    </script>"
  echo "</head>"
  echo "<body>"

  echo "    <h1>Scripts Output in Tabs</h1>"
  echo "    <div class=\"tab-container\">"

  # Loop through each script to create tabs
  index=0
  for script in "${SCRIPTS[@]}"; do
    script_name=$(basename "$script" .sh)
    echo "        <div class=\"tab\" onclick=\"openTab(event, 'content${index}')\">$script_name</div>"
    index=$((index + 1))
  done

  echo "    </div>"

  # Loop through each script again to generate content for each tab
  index=0
  for script in "${SCRIPTS[@]}"; do
    script_name=$(basename "$script" .sh)
    echo "    <div id=\"content${index}\" class=\"tab-content\">"
    echo "        <pre>"

    # Capture the output of the script
    SCRIPT_OUTPUT=$("$script")

    # Output the script's content within <pre> tags for formatting
    echo "$SCRIPT_OUTPUT"

    echo "        </pre>"
    echo "    </div>"
    index=$((index + 1))
  done

  echo "</body>"
  echo "</html>"
} > "$OUTPUT_FILE"

echo "HTML file generated at $OUTPUT_FILE"

