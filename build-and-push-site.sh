#!/bin/bash


## This will clean out the website, build it and push it to the server
## You should make sure everything is working before running this

## You can specify ipv4 or ipv6 and it will use either one.

if [ -z $1 ]; then 
  echo "Specify ipv4 or ipv6"
  exit
fi

rm -rf _site

## Make sure we'll build the site with the real URL, not the dev one
cp _config.yml.realsite _config.yml

## Check the JSON file. Abort if invalid
./check_json.sh
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

if [ $1 == "ipv6" ]; then
  ## We have ipv6, we rock!
  rsync -auv --delete --exclude _h5ai/cache/ --exclude lists/ -e ssh _site/ '[udplmail@2001:470:4b:e0::bbbb]':/var/www/beta_udpl
else
  ## Have only ipv4, must use vpn
  rsync -auv --delete --exclude _h5ai/cache/ --exclude lists/ -e ssh _site/ udplmail@192.168.244.30:/var/www/beta_udpl
fi
