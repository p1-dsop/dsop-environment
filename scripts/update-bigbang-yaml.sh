#!/bin/bash

# Takes 3 arguments
# $1 = environment, e.g. dev or prod
# $2 = github repository
# $3 = branch name

## TODO: Need to do some script arg protections


### URL update

URL="http://github.com/$2"
ESC_URL=$(printf '%s\n' "$URL" | sed -e 's/[\/&]/\\&/g')

sed -i $1/bigbang.yaml -e "s/__CHANGE_ME_REPO_URL__/${ESC_URL}/g"

## Branch update

BRANCH=$3
ESC_BRANCH=$(printf '%s\n' "$BRANCH" | sed -e 's/[\/&]/\\&/g')

sed -i $1/bigbang.yaml -e "s/__CHANGE_ME_REPO_BRANCH__/${ESC_BRANCH}/g"