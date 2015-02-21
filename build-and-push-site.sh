#!/bin/bash

## This will clean out the website, build it and push it to the server
## You should make sure everything is working before running this

rm -rf _site

## Make sure we'll build the site with the real URL, not the dev one
cp _config.yml.realsite _config.yml

## Check the JSON file. Abort if invalid
./check-json.sh
if [ $? -eq 1 ]; then
  echo "JSON file events.txt is not valid JSON. Aborting"
  exit
fi

## Build the site, abort on failure
bundle exec jekyll build
if [ $? -eq 1 ]; then
  echo "Jekyll couldn't build the site. Aborting"
  exit
fi

## Remove mac attributes, probably not needed on linux
xattr -rc _site

## Set permissions and push
chmod -R 755 _site
rsync -auv --delete -e ssh _site/ udplmail@192.168.244.30:/var/www/beta_udpl

