#!/bin/bash

# abort on errors
set -e

rm -rf public

echo Building. this may take a minute...
hugo

# navigate into the build output directory
cd public

# if you are deploying to a custom domain
# echo 'example.com' > CNAME

echo Deploying..
git init
git checkout -b gh-pages
git add -A
git commit -m 'deploy'

# deploy
origin=git@github.com:ColinMaudry/decp-docs.git
git remote add origin $origin
git push -f $origin gh-pages

cd -
