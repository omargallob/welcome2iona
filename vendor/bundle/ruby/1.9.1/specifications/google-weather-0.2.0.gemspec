# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "google-weather"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["John Nunemaker"]
  s.date = "2010-09-11"
  s.description = "stupid simple fetching of the weather using google's api"
  s.email = ["nunemaker@gmail.com"]
  s.executables = ["weather"]
  s.extra_rdoc_files = ["README.rdoc", "LICENSE"]
  s.files = ["bin/weather", "README.rdoc", "LICENSE"]
  s.homepage = "http://github.com/jnunemaker/google-weather"
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "google-weather"
  s.rubygems_version = "1.8.15"
  s.summary = "stupid simple fetching of the weather using google's api"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<httparty>, ["= 0.5.2"])
    else
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<httparty>, ["= 0.5.2"])
    end
  else
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<httparty>, ["= 0.5.2"])
  end
end
