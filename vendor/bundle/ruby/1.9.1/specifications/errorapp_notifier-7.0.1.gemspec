# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "errorapp_notifier"
  s.version = "7.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Arun Agrawal", "Vishnu Atrai"]
  s.date = "2010-12-21"
  s.description = "ErrorApp is a webapp for monitoring exceptions and other failures in your live applications."
  s.extra_rdoc_files = ["LICENSE", "README.md"]
  s.files = ["LICENSE", "README.md"]
  s.homepage = "https://github.com/rubyrockers/errorapp_notifier"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Notifier for sending errors to ErrorApp"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
