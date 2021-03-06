#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git add versions/development/SPEC.md
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://${GH_TOKEN}@github.com/EvanTheB/wdl.git > /dev/null 2>&1
  git push --quiet --set-upstream origin-pages HEAD:$TRAVIS_BRANCH
}

setup_git
commit_website_files
upload_files
