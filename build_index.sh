#!/bin/bash

find . -not -name "404.html" -name '[0-9]*.html' | sort -r | head -1 | while read fname; do
cat > index.html << EOF
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Home</title>
    <link rel="icon" href="favicon.ico">
    <link rel="stylesheet" href="styles.css">
    <meta http-equiv="refresh" content="0; url=${fname:2}" />
    <script type="text/javascript">
        window.location.href="${fname:2}";
    </script>
</head>
<body>
<p><a href="${fname:2}">Redirect</a></p>
</body>
</html>
EOF
done