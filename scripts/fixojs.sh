#!/bin/zsh
# Replace a script type attribute value throughout an .html notebook file.
# Usage: ./fixojs.sh [file] [old-type] [new-type]
# Defaults: file=nbks/TyphoonAnalysis.html, old-type=application/vnd.observable.javascript, new-type=module

set -euo pipefail

# Resolve default file relative to this script's location, not the caller's cwd.
script_dir="${0:A:h}"

file="${1:-${script_dir}/../nbks/TyphoonAnalysis.html}"
old_type="${2:-application/vnd.observable.javascript}"
new_type="${3:-module}"

if [[ ! -f "$file" ]]; then
  echo "File not found: $file" >&2
  exit 1
fi

# In-place edit with a backup, BSD/macOS sed syntax; # delimiter avoids clashing with slashes in the MIME type; runs silently on success
sed -i '.bak' "s#type=\"${old_type}\"#type=\"${new_type}\"#g" "$file"

