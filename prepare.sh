#!/usr/bin/env bash

#brew install p7zip
rm -rf binaries
mkdir binaries
curl -o binaries/ruby.7z http://files.rubyforge.vm.bytemark.co.uk/rubyinstaller/ruby-1.9.3-p392-i386-mingw32.7z
curl -o binaries/devkit.exe http://cloud.github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe
7z x binaries/ruby.7z
mv ruby-1.9.3-p392-i386-mingw32 binaries/PortableRuby
mv binaries/devkit.exe binaries/PortableRuby
cd binaries/PortableRuby && 7z x devkit.exe && cd ../..
mv binaries/PortableRuby/devkit.exe binaries
cp start-cmd.bat binaries/PortableRuby
cp gemrc binaries/PortableRuby/etc
cp postinstall.sh binaries/PortableRuby/bin
ruby patch.rb
rm portable_ruby.zip
zip -r portable_ruby.zip binaries/PortableRuby