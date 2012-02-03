# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "tag_helper"
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dejan Simic"]
  s.date = "2011-07-04"
  s.description = "TagHelper is a zero dependency, lightweight Ruby lib for building XHTML tags similar to the API provided by Rails' *TagHelper modules."
  s.email = "desimic@gmail.com"
  s.homepage = "http://github.com/dejan/tag_helper"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Build XHTML tags off the Rails"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
