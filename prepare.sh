#!/usr/bin/env bash

# brew install p7zip wget (needed for un7ipping and wgetting, guess you can try apt-get install p7zip on debian/ubuntu)

# start with a clean slate
rm -rf binaries
mkdir binaries

# download the main ingriedients
echo "Downloading Ruby..."
#wget -O binaries/ruby.7z http://dl.bintray.com/oneclick/rubyinstaller/ruby-1.9.3-p551-i386-mingw32.7z
# wget -O binaries/ruby.7z http://dl.bintray.com/oneclick/rubyinstaller/ruby-2.2.2-i386-mingw32.7z
wget -O binaries/ruby.7z http://dl.bintray.com/oneclick/rubyinstaller/ruby-2.1.6-i386-mingw32.7z

echo "Downloading DevKit..."
#wget -O binaries/devkit.exe http://dl.bintray.com/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe
wget -O binaries/devkit.exe http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe

echo "Downloading SQLite source..."
wget -O binaries/sqlite_src.tar.gz  http://www.sqlite.org/2015/sqlite-autoconf-3081002.tar.gz

# unzip and mix
echo "Unzip and combine..."
7z x binaries/ruby.7z
#mv ruby-1.9.3-p551-i386-mingw32 binaries/PortableRuby
#mv ruby-2.2.2-i386-mingw32 binaries/PortableRuby
mv ruby-2.1.6-i386-mingw32 binaries/PortableRuby
mv binaries/devkit.exe binaries/PortableRuby
cd binaries/PortableRuby && 7z x devkit.exe && cd ../..
tar -zxvf binaries/sqlite_src.tar.gz
mkdir binaries/PortableRuby/src
mv sqlite-autoconf-3081002 binaries/PortableRuby/src/sqlite3
mv binaries/PortableRuby/devkit.exe binaries

# seasoning
echo "Seasoning..."
cp start-cmd.bat binaries/PortableRuby
cp testssl.rb binaries/PortableRuby/bin
cp gemrc binaries/PortableRuby/etc
cp ca-bundle.pem binaries/PortableRuby/lib/ruby/2.1.0/rubygems/ssl_certs
echo "export SSL_CERT_FILE=/lib/ruby/2.1.0/rubygems/ssl_certs/ca-bundle.pem" >> binaries/PortableRuby/etc/profile
echo "export PATH=\"/lib/sqlite3/bin:\$PATH\"" >> binaries/PortableRuby/etc/profile
cp postinstall.sh binaries/PortableRuby/bin
cp bonus/wkhtmltopdf/* binaries/PortableRuby/bin

# cleanup
echo "Cleanup..."

rm -rf binaries/PortableRuby/postinstall
rm binaries/PortableRuby/m.ico
rm binaries/PortableRuby/msys.ico
rm binaries/PortableRuby/dk.rb
rm binaries/PortableRuby/msys.bat
rm binaries/PortableRuby/devkitvars.*

# make sure the files generated in /bin work 'anywhere'
echo "Fixes..."
ruby patch.rb

# and let me package it for you (in plain old WindowsXP-compatible .zip)
echo "Packaging..."

rm portable_ruby.zip
cd binaries
zip -r ../portable_ruby.zip PortableRuby
echo "Done."
echo ""
echo "To finalize, run start-cmd.bat in windows and run 'postinstall.sh' in the MinGW terminal."
echo "(please note that you shouldn't run this from a network drive (or a mapped VirtualBox-drive). Doesn't work. I've tried this :/ )"