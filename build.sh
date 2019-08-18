#!/bin/bash

siteRoot=$1

bash ./build_index.sh
bash ./build_sitemap.sh
bash ./build_toc.sh $siteRoot
bash ./build_rss.sh