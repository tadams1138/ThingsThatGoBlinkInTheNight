#!/bin/bash

siteRoot=$1

cat > toc.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" href="styles.css">
    <title>Table of Contents</title>
</head>
<body>
<a href="$siteRoot/rss.xml" class="feed">Subscribe to the feed</a>
<ul>
EOF

cat > toc.txt << EOF
<a href="$siteRoot/rss.xml" class="feed">Subscribe to the feed</a>
<ul>
EOF

find . -name '*.html' | sort -r | while read fname; do
    title="$(grep -P -o '(?<=<title>).*(?=</title>)' "$fname")"
    href="$siteRoot${fname:1}"
    html="<li><a href=$href>$title</a></li>"
    echo "$html" | cat >> toc.html
    echo "$html" | cat >> toc.txt
done

cat >> toc.html << EOF
</ul>
</body>
</html>
EOF

cat >> toc.txt << EOF
</ul>
EOF

