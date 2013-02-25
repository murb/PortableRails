PortableRails3(.0)
==================

The InstantRails project ( http://instantrails.rubyforge.org/ ) is outdated and contains just too much IMHO ( Apache, PHP, who needs that when searching for Rails? ). Other options to get Rails running require an installer ( http://railsinstaller.org/ or http://rubyinstaller.org/ )... and in some environments ( limited access accounts ) installing is not an option. And in yet other environments, you'd, well I'd, rather have a command line option, instead of an in-your-face installer that requires end-users to press 'next', 'next', 'next'...

So that's why I created Portable Rails 3. It's name was 'inspired' by the thoughtfully named Portable Git ( http://code.google.com/p/msysgit/downloads/list ) which makes an excelent companion.

Installing is as simple as extracting (or cloning) and running `start-cmd.bat`.

**Update feb '13**: The approach used to get 3.0 working was OK for very basic Rails 3.0 apps, but the newer rails versions and several popular gems require you to have a compiler installed. I'll update the master branch soon with a recipe to obtain a portable Rails 3.2 install. The 3.2 install is to some extend, sadly, less portable as it will be significantly bigger, hence I'll leave 3.0 here in this branch untouched for those who are interested in a simpler light weight package just to experiment a bit with Rails 3.x.

- Maarten - http://murb.nl

Credits
-------

I didn't do much besides just throwing the binary stuff together. Stuff that went into the mix (I'll update when I feel its necessary):

- Ruby 1.9.2 http://www.ruby-lang.org/en/
- PDCurses [1]
- GDBM  [1]
- OpenSSL [1]
- readline [1]
- Zlib  [1]
- IconV Meadowy.org
- RubyGems 1.7.2 (updated with update --system )
- Rails 3.0.6 (preinstalled as gem)
- SQLite3 (preinstalled sqlite3-gem + sqlite3.dll as instructed by the SQLite3-gem-installation)


[1] Downloaded from (basically as instructed at http://www.garbagecollect.jp/ruby/mswin32/en/documents/install.html ): http://jarp.does.notwork.org/win32/