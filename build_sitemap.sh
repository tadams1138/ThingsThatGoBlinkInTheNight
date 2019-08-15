#!/bin/bash

cat > sitemap.xml << EOF
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
EOF

find . -name '*.html' | sort -r | while read fname; do
  title=$fname
cat >> sitemap.xml << EOF
   <url>
      <loc>https://www.tandisoft.com/${fname:2}</loc>
      <changefreq>never</changefreq>
   </url>
EOF
done

cat >> sitemap.xml << EOF
</urlset>
EOF

