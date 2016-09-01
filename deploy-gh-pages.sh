#!/bin/bash

# generate the site
./hugoThemeSiteScript/generateThemeSite.sh https://davidyorr.github.io/hugo-orchid-theme/
hugo -s hugoThemeSite/themeSite -b https://davidyorr.github.io/hugo-orchid-theme

# clone master into a temp directory
TMP_DIR=temp
rm -rf $TMP_DIR
git clone git@github.com:davidyorr/hugo-orchid-theme.git $TMP_DIR
cd $TMP_DIR

# checkout the gh-pages branch and copy the site into it
git checkout -t origin/gh-pages
rm -rf *
cp -R ../hugoThemeSite/themeSite/public/* .

# push changes
git add -A
git commit -m "Built $(date)"
git push origin gh-pages

# delete the temp directory
cd ..
rm -rf $TMP_DIR
