@echo off
@if not "%~d0" == "~d0" goto WinNT
C:\lan\ruby-1.9.2-p136\bin\ruby -x "C:/lan/ruby-1.9.2-p136/bin/rdoc.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9
@goto endofruby
:WinNT
"%~dp0ruby" -x "%~f0" %*
@goto endofruby
#!C:/lan/ruby-1.9.2-p136/bin/ruby
#
#  RDoc: Documentation tool for source code
#        (see lib/rdoc/rdoc.rb for more information)
#
#  Copyright (c) 2003 Dave Thomas
#  Released under the same terms as Ruby
#
#  $Revision: 27147 $

require 'rdoc/rdoc'

begin
  r = RDoc::RDoc.new
  r.document ARGV
rescue SystemExit
  raise
rescue Exception => e
  if $DEBUG_RDOC then
    $stderr.puts e.message
    $stderr.puts "#{e.backtrace.join "\n\t"}"
    $stderr.puts
  elsif Interrupt === e then
    $stderr.puts
    $stderr.puts 'Interrupted'
  else
    $stderr.puts "uh-oh! RDoc had a problem:"
    $stderr.puts e.message
    $stderr.puts
    $stderr.puts "run with --debug for full backtrace"
  end

  exit 1
end

__END__
:endofruby
