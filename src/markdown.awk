#!/usr/bin/awk -f
# Scan through YAML.  
# If Markdown is found, convert it the Html.
#
# Usage:
#   cat file.yaml | ./markdown.awk
#

BEGIN { }

# Start and end (based on indentation)
$0 ~ /^  Markdown: \|/ {
  MARKDOWN_START = 1
}
$0 !~ /^    / {
  MARKDOWN_END = 1
}

{
  # strip indentation, convert to html, handle (R)(C)(TM), then add indentation back in.
  convert = "sed 's/^    //' | markdown | sed 's/(R)/\\&reg;/g; s/(C)/\\&copy;/g; s/(TM)/\\&trade;/g' | sed 's/^/    /'"
  if (MARKDOWN_START) {
    MARKDOWN = 1
    print "  Html: |"
  } else if (MARKDOWN) {
    if (MARKDOWN_END) {
      MARKDOWN = 0
      close (convert)
      print
    } else {
      print | (convert)
    }
  } else {
    print
  }
  MARKDOWN_START = MARKDOWN_END = 0
}

END {}
