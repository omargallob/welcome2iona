# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "sitemap_generator"
  s.version = "2.1.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Karl Varga", "Adam Salter"]
  s.date = "2011-10-29"
  s.description = "SitemapGenerator is a Rails gem that makes it easy to generate enterprise-class Sitemaps readable by all search engines.  Generated Sitemaps adhere to the Sitemap protocol specification.  When you generate new Sitemaps, SitemapGenerator can automatically ping the major search engines (including Google, Yahoo and Bing) to notify them.  SitemapGenerator includes rake tasks to easily manage your sitemaps."
  s.email = "kjvarga@gmail.com"
  s.extra_rdoc_files = ["README.md"]
  s.files = ["README.md"]
  s.homepage = "http://github.com/kjvarga/sitemap_generator"
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "Easily generate enterprise class Sitemaps for your Rails site using a familiar Rails Routes-like DSL"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<github>, [">= 0"])
      s.add_development_dependency(%q<git>, [">= 0"])
    else
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<github>, [">= 0"])
      s.add_dependency(%q<git>, [">= 0"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<github>, [">= 0"])
    s.add_dependency(%q<git>, [">= 0"])
  end
end
