@echo off
@if not "%~d0" == "~d0" goto WinNT
C:\lan\ruby-1.9.2-p136\bin\ruby -x "C:/lan/ruby-1.9.2-p136/bin/testrb.bat" %1 %2 %3 %4 %5 %6 %7 %8 %9
@goto endofruby
:WinNT
"%~dp0ruby" -x "%~f0" %*
@goto endofruby
#!C:/lan/ruby-1.9.2-p136/bin/ruby
require 'test/unit'
Test::Unit.setup_argv {|files|
  if files.empty?
    puts "Usage: testrb [options] tests..."
    exit 1
  end
  if files.size == 1
    $0 = File.basename(files[0])
  else
    $0 = files.to_s
  end
  files
}
__END__
:endofruby
