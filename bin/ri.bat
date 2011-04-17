@echo off
@if not "%~d0" == "~d0" goto WinNT
C:\lan\ruby-1.9.2-p136\bin\ruby -x "C:/lan/ruby-1.9.2-p136/bin/ri.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9
@goto endofruby
:WinNT
"%~dp0ruby" -x "%~f0" %*
@goto endofruby
#!C:/lan/ruby-1.9.2-p136/bin/ruby

require 'rdoc/ri/driver'

RDoc::RI::Driver.run ARGV
__END__
:endofruby
