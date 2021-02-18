#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

REPONAME=`basename $PWD`
PARENTDIR=`dirname $PWD`
USERNAME=`basename $PARENTDIR`
cd output

git init
git config user.name "Amplexor XML Deployer"
git config user.email "nicolas.delobel@amplexor.com"

git remote add upstream "https://$GH_TOKEN@github.com/$USERNAME/$REPONAME.git"
git fetch upstream
git reset upstream/ditaot-publishing-outputs

touch .

ls
git status

#!if [ "$TRAVIS_BRANCH" != "master" ]
#!then
#!  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
#!  exit 0
#!fi

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:ditaot-publishing-outputs
