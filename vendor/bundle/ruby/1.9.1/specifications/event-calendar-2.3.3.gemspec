# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "event-calendar"
  s.version = "2.3.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeff Schuil"]
  s.date = "2011-03-03"
  s.description = "Rails helper for showing multiple, overlapping events across calendar days and rows."
  s.email = ""
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc"]
  s.homepage = "http://github.com/elevation/event_calendar"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Rails helper for showing multiple, overlapping events across calendar days and rows."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
