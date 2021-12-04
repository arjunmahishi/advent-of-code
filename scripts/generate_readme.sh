# !/usr/bin/sh

cat ./scripts/readme_template.md > README.md

find . -type f |\
  grep "day\d\+" |\
  awk -F '/' '{print $2, $3}' |\
  uniq |\
  awk '{print $1}' |\
  uniq -c |\
  lua scripts/generate_section.lua >> README.md
