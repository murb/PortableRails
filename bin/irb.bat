@echo off
@if not "%~d0" == "~d0" goto WinNT
C:\lan\ruby-1.9.2-p136\bin\ruby -x "C:/lan/ruby-1.9.2-p136/bin/irb.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9
@goto endofruby
:WinNT
"%~dp0ruby" -x "%~f0" %*
@goto endofruby
#!C:/lan/ruby-1.9.2-p136/bin/ruby
#
#   irb.rb - interactive ruby
#   	$Release Version: 0.9.6 $
#   	$Revision: 25189 $
#   	by Keiju ISHITSUKA(keiju@ruby-lang.org)
#

require "irb"

if __FILE__ == $0
  IRB.start(__FILE__)
else
  # check -e option
  if /^-e$/ =~ $0
    IRB.start(__FILE__)
  else
    IRB.setup(__FILE__)
  end
end
__END__
:endofruby
