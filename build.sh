#!/bin/sh
rm -rf out
mkdir out
cp background/* out/
ttree -a -f ttreerc -s src -d out
chmod a+rX -R out/
mkdir out/lbwsite.git
cd out/lbwsite.git
git init --bare
cd -
git push --mirror out/lbwsite.git master
cd out/lbwsite.git
git update-server-info
cd -
chmod a+rX -R out/
