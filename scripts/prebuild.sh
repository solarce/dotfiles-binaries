#!/usr/bin/env bash

export PATH="~/pkg/bin:~/pkg/sbin:$PATH"
cd /home/ubuntu
mkdir build

ls /home/ubuntu/cache
echo "===="
DATE=$(date)
echo "Testing cache $DATE"
echo $DATE > /home/ubuntu/cache/test_"$DATE".txt
echo "===="
ls /home/ubuntu/cache
# The docker image we use for builds includes a bootstrapped
# pkgsrc, if we're doing a fresh CI job, we want to move
# the contents of pkgsrc to a Volume mount that CI will cache for us
#if [ ! -f /home/ubuntu/cache/pkgsrc/synced.txt ]
#then
#  echo "Syncing pkgsrc"
#  rsync -aP -q /home/ubuntu/pkgsrc/ /home/ubuntu/cache/pkgsrc/
#  rm -r /home/ubuntu/pkgsrc
#  ln -s /home/ubuntu/cache/pkgsrc /home/ubuntu/pkgsrc
#fi

#if [ ! -d /home/ubuntu/cache/packages ]
#then
#  echo "Making packages cache"
#  mkdir -p cache/packages
#  rm -r /home/ubuntu/pkgsrc/packages
#  ln -s /home/ubuntu/cache/packages /home/ubuntu/pkgsrc/packages
#fi



# Build the packages listed in packages.txt
#ruby /home/ubuntu/code/scripts/build.rb

