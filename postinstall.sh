#!/usr/bin/env bash

echo gem: --no-ri --no-rdoc > ~/.gemrc
gem install rails
cp /bin/gem.bat /bin/bin.template && for file in /bin/*.bat; do cp /bin/bin.template $file; done
rails -v