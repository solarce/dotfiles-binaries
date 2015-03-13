#!/usr/bin/env bash

su ubuntu <<EOSU
export PATH="~/pkg/bin:~/pkg/sbin:$PATH"
export BUNDLE_PATH="/home/ubuntu/.gems"
cd /home/ubuntu
mkdir build
mkdir cache
cd code/scripts
bundle install
bundle exec ./build.rb
EOSU
