# PortableRails3(.2)

The InstantRails project ( http://instantrails.rubyforge.org/ ) is outdated and contains just too much IMHO ( Apache, PHP, who needs that when searching for Rails? ). Other options to get Rails running require an installer ( http://railsinstaller.org/ or http://rubyinstaller.org/ )... and in some environments ( limited access accounts ) installing is not an option. And in yet other environments, you'd, well I'd, rather have a command line option, instead of an in-your-face installer that requires end-users to press 'next', 'next', 'next'...

So that's why I created two years ago Portable Rails 3. It's name was 'inspired' by the thoughtfully named Portable Git ( http://code.google.com/p/msysgit/downloads/list ) which makes an excelent companion.

Installing was as simple as extracting (or cloning) and running `start-cmd.bat`, but things have changed in the meantime. Rails 3.2 expects a compiler present on the system, and for this the approach that worked for 3.0 no longer works.

Luckily things have changed, but it isn't as easy as what I called PortableRails3 ([the original PortableRails3 is still available in the 3.0 branch](https://github.com/murb/PortableRails3/tree/3.0)). So for now I'll call it a recipe. A dumb recipe, as you've got to perform these steps still manually, but they're quite easy. I won't publish the result on Github anymore, since I don't think it is the right platform for an end result that is just mix 'n blend binaries.

## The recipe

Don't like to cook by yourself, scroll down, I made it for you.

### Ingredients

- The latest ruby in .7z format (http://rubyforge.org/frs/download.php/76799/ruby-1.9.3-p392-i386-mingw32.7z)
- The latest *MinGW*-DevKit as self-extracting .exe (actually a .7z as well) (http://rubyforge.org/frs/download.php/76805/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe)

### Instructions

1. Extract the latest ruby.
2. Extract the latest DevKit
3. Copy the contents of the DevKit folder onto the ruby folder. (by now you've already something that consumes 450MB(!) of your precious SSD/HDD-space)
4. (can be skipped) rename `msys.bat` to `start-cmd.bat` (for PortableRails3.0 compatibility ;) and more obvious naming)
5. Fix the start-cmd.bat file to support spaces in dirs, copy the 
6. Run start-cmd.bat (or msys.bat)
7. Make sure docs won't get installed `echo gem: --no-ri --no-rdoc > ~/.gemrc` (unless you want them, you can skip this step, I prefer The Internet)
8. And type the magical `gem install rails` followed by Enter (and btw. bless yourself with the fact that you're now in a more or less [POSIX](http://en.wikipedia.org/wiki/POSIX)-compatible environment)
9. Fix yourself a nice cup of coffee
10. Seeing the prompt again? Type `rails -v` and see how it responds with somthing like `Rails 3.2.12`: congrats, you've got it installed, but it isn't portable (yet)
11. Make sure that the gem installed batch files work in a portable setting: `cp /bin/gem.bat /bin/bin.template && for file in /bin/*.bat; do cp /bin/bin.template $file; done`
12. Seeing the prompt again? Type `rails -v` and see how it *still* responds with somthing like `Rails 3.2.12`: congrats, you've got it portable (test it by zipping it and unpacking it somewhere else)

## The instant meal

Allright, you came here to not do it by yourself... [here it is ~160MB zipped](https://www.box.com/s/7o1sqrvqey1t9ii4hv28) (on box.com, in just plain old zip so you can really extract it anywhere), it won't be the latest and the greatest all time... but that's the thing with instant food, it is never as fresh when you make it on your own.

## Future

Ideally would I let my and/or your computer cook for you by just adding the ingredients together in a simple script, until that day just pray or do whatever ([getting in touch with me](http://murb.nl/contact) me probably helps better) that I'll update the things manually every now and then.

## Bugs, suggestions?

The software has been tested on Windows XP running on a MacBookPro via Virtual Box and a locked down Hewlett Packard machine within a bank (I guess that means pretty much locked down) and it worked. I hope it also works for you within your school, university or company. If it doesn't try harder first, and then [try contacting me](http://murb.nl/contact).