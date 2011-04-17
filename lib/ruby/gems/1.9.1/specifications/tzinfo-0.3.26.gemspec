# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tzinfo}
  s.version = "0.3.26"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Philip Ross"]
  s.date = %q{2011-04-02}
  s.description = %q{TZInfo is a Ruby library that uses the standard tz (Olson) database to provide daylight savings aware transformations between times in different time zones.}
  s.email = %q{phil.ross@gmail.com}
  s.extra_rdoc_files = ["README", "CHANGES"]
  s.files = ["README", "CHANGES"]
  s.homepage = %q{http://tzinfo.rubyforge.org/}
  s.rdoc_options = ["--exclude", "definitions", "--exclude", "indexes"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{tzinfo}
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Daylight-savings aware timezone library}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
