#!/usr/bin/env bash
#
# Copy theme related files and folders to current directory without overwrite.

copy() {
  _theme_path="$(bundle info --path jekyll-theme-chirpy)/*"
  cp -rn $_theme_path ./
}

copy
