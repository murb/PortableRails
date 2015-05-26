#!/usr/bin/env ruby
files = ['binaries/PortableRuby/lib/ruby/2.1.0/rubygems/installer.rb'] #,'binaries/PortableRuby/lib/ruby/site_ruby/2.2.0/rubygems/installer.rb'
files.each do |file|
  text = File.open(file).read
  text.gsub!("return '#!/usr/bin/env ruby'","")
  text.gsub!(/def shebang(.*)/,"def shebang(a)\nreturn '#!/usr/bin/env ruby'")
  File.open(file,'w'){|f| f.puts text}
  puts "Patched #{file}."
end