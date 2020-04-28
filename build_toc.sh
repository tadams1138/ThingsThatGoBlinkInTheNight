#!/bin/bash

write_list_item() {
  siteRoot=$1
  output=$2
  count=$3
  find . -not -path "./p/*" -not -name "404.html" -name '*.html' | sort -r | head -"$count" | while read -r fname; do
    title="$(grep -P -o '(?<=<title>).*(?=</title>)' "$fname")"
    href="$siteRoot${fname:1}"
    html="<li><a href=$href>$title</a></li>"
    echo "$html" | cat >>"$output"
  done
}

siteRoot=$1

cat >toc.html <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" href="styles.css">
    <title>Table of Contents</title>
    <script data-ad-client="ca-pub-1999637070859163" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
</head>
<body>
<a href="$siteRoot/rss.xml" class="feed">Subscribe to the feed</a>
<ul>
EOF
write_list_item "$siteRoot" "toc.html" 99999999
cat >>toc.html <<EOF
</ul>
</body>
</html>
EOF

cat >toc.txt <<EOF
<a href="$siteRoot/rss.xml" class="feed">Subscribe to the feed</a>
<ul>
EOF
write_list_item "$siteRoot" "toc.txt" 18
cat >>toc.txt <<EOF
</ul>
EOF
