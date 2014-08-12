# PortableRails3(.2)

The InstantRails project ( http://instantrails.rubyforge.org/ ) is outdated and contains just too much IMHO ( Apache, PHP, who needs that when searching for Rails? ). Other options to get Rails running require an installer ( http://railsinstaller.org/ or http://rubyinstaller.org/ ), which is good, but in some environments ( limited access accounts ) installing is not an option. And in yet other environments, you'd, well I'd, rather have a command line option, instead of an in-your-face installer that requires end-users to press 'next', 'next', 'next'...

So that's why about two years ago I created Portable Rails 3. It's name was 'inspired' by the thoughtfully named Portable Git ( http://code.google.com/p/msysgit/downloads/list ) which could make an excelent companion.

Installing was as simple as extracting (or cloning) and running `start-cmd.bat`, but things have changed in the meantime. Rails 3.2 expects a compiler present on the system, and for this the approach that worked for 3.0 no longer works.

Luckily things have changed, but it isn't as portable as what I named PortableRails3 two years ago ([the original PortableRails3 is still available in the 3.0 branch](https://github.com/murb/PortableRails3/tree/3.0)). So for now I'll call it a recipe. A dumb recipe, as you've got to perform these steps still manually, but they're quite easy. As I don't think Github is meant for sharing binaries I won't publish the result on Github anymore.

## The recipe

Don't like to cook by yourself, scroll down to Recipe C... A is for DIY'rs and B for something in between... (B is actually the work in progress to automate the process of creating new versions of C)

### Recipe A - Script me if you can

1. Download [portable ruby](https://www.box.com/s/7o1sqrvqey1t9ii4hv28) (basically step 1 to 4 or recipe A) or *create it* running the prepare.sh-script (only tested this on MacOS-X, but it isn't really advanced stuff here)
2. Extract it
3. Run `start-cmd.bat`
4. Run `postinstall.sh` (which takes basically care of step 6 to 11 of recipe A)

### Recipe B - DIY

#### Ingredients

- The latest ruby in .7z format (http://rubyforge.org/frs/download.php/76799/ruby-1.9.3-p392-i386-mingw32.7z)
- The DevKit as self-extracting .exe (actually a .7z as well) (http://cloud.github.com/downloads/oneclick/rubyinstaller/DevKit-tdm-32-4.5.2-20111229-1559-sfx.exe)

(in case you're looking for the latest and greatest versions, have a look at the [ruby installer download page](http://rubyinstaller.org/downloads/))

#### Instructions

(actually some details are left out of this recipe, check prepare.sh and postinstall.sh if you run into problems with this approach)

1. Extract the latest ruby.
2. Extract the latest DevKit
3. Copy the contents of the DevKit folder onto the ruby folder. (by now you've already something that consumes 450MB(!) of your precious SSD/HDD-space)
4. Copy https://github.com/murb/PortableRails3/raw/master/start-cmd.bat to the main dir.
5. Run `start-cmd.bat`
6. Make sure docs won't get installed `echo gem: --no-ri --no-rdoc > ~/.gemrc` (unless you want them, you can skip this step, I prefer The Internet)
7. Open both `installer.rb` files found in the rubygems folders (`/lib/ruby/1.9.1/rubygems/installer.rb` and `/lib/ruby/site_ruby/1.9.1/rubygems/installer.rb`) and make sure that the lines after `def shebang(a)` reads `return '#!/usr/bin/env ruby'` (all rest in this method will now be skipped, and actually this line is enough)
8. And type the magical `gem install rails` followed by Enter (and btw. bless yourself with the fact that you're now in a more or less [POSIX](http://en.wikipedia.org/wiki/POSIX)-compatible environment)
9. Fix yourself a nice cup of coffee
10. Seeing the prompt again? Type `rails -v` and see how it responds with somthing like `Rails 3.2.12`: congrats, you've got it installed, but it isn't portable (yet)
11. Make sure that the gem installed batch files work in a portable setting: `cp /bin/gem.bat /bin/bin.template && for file in /bin/*.bat; do cp /bin/bin.template $file; done`
12. Seeing the prompt again? Type `rails -v` and see how it *still* responds with somthing like `Rails 3.2.12`: congrats, you've got it portable (test it by zipping it and unpacking it somewhere else)

In case you're bothered with a warning "DL is depricated", just uncomment the line `warn "DL is deprecated, please use Fiddle"` in /lib/ruby/2.0.0/dl.rb (hat tip to mamat hensem)

### Recipe C - The instant meal

Allright, you came here not to do it yourself... [here it is prebundled, ~83MB zipped](https://www.box.com/s/7o1sqrvqey1t9ii4hv28) (on box.com, in just plain old zip so you can really extract it anywhere), it won't be the latest and the greatest all time... but that's the thing with instant food, it is never as fresh when you make it on your own.

## Future

Updating to the latest and greatest should be made easier for the maintainer (now me). That's what `prepare.sh` (recipe A) is about to become, which I can run on my (MacOS-X) machine to prepare a simple .zip file that can be moved to a windows machine.

## Bugs, suggestions?

The software has been tested on Windows XP running on a MacBookPro via Virtual Box and a locked down Hewlett Packard machine within a bank (I guess that means pretty much locked down) and it worked. I hope it also works for you within your school, university or other company. If it doesn't try harder first, and then [try contacting me](http://murb.nl/contact).

## Credits

All credits go to the http://rubyinstaller.org/downloads/ team. I hardly did anything. Give them a big thanks!