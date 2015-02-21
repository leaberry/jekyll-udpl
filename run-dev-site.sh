#!/bin/bash
 
## This will fire up the dev site for testing on localhost:4000

cp _config.yml.localhost _config.yml
bundle exec jekyll serve


