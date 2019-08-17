#!/bin/bash

siteRoot=$1

bash ./build_sitemap.sh
bash ./build_toc.sh $siteRoot