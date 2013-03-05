#!/usr/bin/env bash

# skip installing docs
echo gem: --no-ri --no-rdoc > ~/.gemrc
echo "export SSL_CERT_FILE=/lib/ruby/site_ruby/1.9.1/rubygems/ssl_certs/ca-bundle.pem" > ~/.profile

# install rails (we want to offer portable*Rails*)
gem install rails

# 
cp /bin/gem.bat /bin/bin.template && for file in /bin/*.bat; do cp /bin/bin.template $file; done

# show the version
rails -v

# install rails to make sure all the required gems are installed for a default config
rails new murb

# and remove the mess
rm -rf murb