@echo off
@if not "%~d0" == "~d0" goto WinNT
C:\lan\ruby-1.9.2-p136\bin\ruby -x "C:/lan/ruby-1.9.2-p136/bin/rake.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9
@goto endofruby
:WinNT
"%~dp0ruby" -x "%~f0" %*
@goto endofruby
#!C:/lan/ruby-1.9.2-p136/bin/ruby

#--
# Copyright (c) 2003, 2004, 2005, 2006, 2007  Jim Weirich
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to
# deal in the Software without restriction, including without limitation the
# rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
# sell copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
# IN THE SOFTWARE.
#++

begin
  require 'rake'
rescue LoadError
  require 'rubygems'
  require 'rake'
end
Rake.application.run
__END__
:endofruby
