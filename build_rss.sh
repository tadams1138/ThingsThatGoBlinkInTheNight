#!/bin/bash

cat > rss.xml << EOF
<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0">
  <channel>
    <title>Things that go blink in the night</title>
    <link>https://www.tandisoft.com</link>
    <description>A blog for Tom Adams tech ramblings</description>
EOF

find . -name '[0-9]*.html' | sort -r | head -5 | while read fname; do
    title="$(grep -P -o '(?<=<title>).*(?=</title>)' "$fname")"
cat >> rss.xml << EOF
    <item>
      <title>$title</title>
      <link>https://www.tandisoft.com/${fname:2}</link>
      <description>$title</description>
    </item>
EOF
done

cat >> rss.xml << EOF
  </channel>
</rss>
EOF

