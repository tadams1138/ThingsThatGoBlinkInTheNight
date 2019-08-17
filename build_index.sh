#!/bin/bash

find . -name '[0-9]*.html' | sort -r | head -1 | while read fname; do
  fileName=$(echo "${fname:2}" | sed 's/\//\\\//g')
  sed -i "s/href=\".*\.html\"/href=\"$fileName\"/g" index.html
  sed -i "s/url=.*\.html\"/url=$fileName\"/g" index.html
done

