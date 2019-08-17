#!/bin/bash

siteRoot=$1

cat > toc.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" href="styles.css">
    <script type="text/javascript" src="scripts.js"></script>
    <title>Table of Contents</title>
</head>
<body>
<ul>
EOF

find . -name '*.html' | sort -r | while read fname; do
    title="$(grep -P -o '(?<=<title>).*(?=</title>)' $fname)"
    href="$siteRoot${fname:1}"
cat >> toc.html << EOF
<li><a href="$href">$title</a></li>
EOF
done

cat >> toc.html << EOF
</ul>
</body>
</html>
EOF

