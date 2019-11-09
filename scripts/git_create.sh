#!/bin/sh

user_name=$1
repo_name=$2
test -z $user_name && echo "User name required." 1>&2 && exit 1
test -z $repo_name && echo "Repo name required." 1>&2 && exit 1

curl -u  $user_name https://api.github.com/user/repos -d "{\"name\":\"$repo_name\"}"

git init 
sleep 1

git remote add origin "https://github.com/$user_name/$repo_name.git"
sleep 1
git add .
sleep 1

git commit -m "first"
sleep 1

git push --set-upstream origin master
