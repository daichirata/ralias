# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ralias/version"

Gem::Specification.new do |s|
  s.name        = "ralias"
  s.version     = Ralias::VERSION
  s.authors     = ["Daic_h"]
  s.email       = ["bunny.hop.md@gmail.com"]
  s.homepage    = ""
  s.summary     = 'to extend the alias of shell in ruby'
  s.description = s.summary

  s.rubyforge_project = "ralias"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rake',      '>= 0.9.2.2'
  s.add_development_dependency 'rspec',     '>= 2.7.0'
end
