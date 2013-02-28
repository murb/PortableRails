#!/usr/bin/env bash

# brew install p7zip (needed for un7ipping, guess you can try apt-get install p7zip on debian/ubuntu)

# start with a clean slate
rm -rf binaries
mkdir binaries

# download the main ingriedients
curl -o binaries/ruby.7z http://files.rubyforge.vm.bytemark.co.uk/rubyinstaller/ruby-1.9.3-p392-i386-mingw32.7z
curl -o binaries/devkit.exe http://cloud.github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe

# unzip and mix
7z x binaries/ruby.7z
mv ruby-1.9.3-p392-i386-mingw32 binaries/PortableRuby
mv binaries/devkit.exe binaries/PortableRuby
cd binaries/PortableRuby && 7z x devkit.exe && cd ../..
mv binaries/PortableRuby/devkit.exe binaries

# seasoning
cp start-cmd.bat binaries/PortableRuby
cp gemrc binaries/PortableRuby/etc
cp postinstall.sh binaries/PortableRuby/bin

# make sure the files generated in /bin work 'anywhere'
ruby patch.rb

# and let me package it for you (in plain old WindowsXP-compatible .zip)
rm portable_ruby.zip
zip -r portable_ruby.zip binaries/PortableRuby