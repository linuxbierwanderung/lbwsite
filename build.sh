#!/bin/sh
rm -rf out
mkdir out
cp background/* out/
ttree -a -f ttreerc -s src -d out
chmod a+rX -R out/
git update-server-info
