#!/bin/bash

echo 'setting -e flag set, so the script will stop if any command inside it fails...'
set -e
echo 'Done'

echo 'Checking script arguments...'
if [ -z "$1" ] ; then
    echo 'You should provide the username of Github to fetch the public repos'
    echo 'Example: ./fetchGithubPublicRepos arcones'
    exit 1
else
    username="$1"
    echo "The public GitHub repos of $username will be fetched"
fi
echo 'Done'

echo 'Removing possible leftovers from past executions'
rm -rf ${username}_public_github_repos.csv
echo 'Done'

echo 'Fetching all public repos'
curl -s https://api.github.com/users/$username/repos | grep \"clone_url\" > ${username}_public_github_repos.csv
sed -i 's/ *.clone_url.. .//g' ${username}_public_github_repos.csv
sed -i 's/",//g' ${username}_public_github_repos.csv
echo 'Done'
