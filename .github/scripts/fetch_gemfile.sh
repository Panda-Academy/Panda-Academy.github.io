#!/usr/bin/env bash
#
# Download Gemfile (if not exists) from cotes2020/jekyll-theme-chirpy, and update theme version to latest.

fetch() {
  if [[ ! -f $_gemfile ]]; then
    _base_url="https://raw.githubusercontent.com/cotes2020/jekyll-theme-chirpy/master"
    _gemspec_url="$_base_url/jekyll-theme-chirpy.gemspec"
    _gemfile_url="$_base_url/Gemfile"

    _version="$(curl -fsSL $_gemspec_url | grep "spec.version" | sed 's/.*= "//;s/".*//')"
    _big_version="${_version%.*}"
    _replacement="gem \"jekyll-theme-chirpy\", \"~> $_big_version\", \">= $_version\""

    curl -fsSL $_gemfile_url > Gemfile
    sed -i "s/gemspec/$_replacement/g" Gemfile
  fi
}

fetch
