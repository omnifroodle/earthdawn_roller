# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "earthdawn_roller/version"

Gem::Specification.new do |s|
  s.name        = "earthdawn_roller"
  s.version     = EarthdawnRoller::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Matt Overstreet"]
  s.email       = ["matt.overstreet@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Dice engine for 3rd ed Earthdawn}
  s.description = %q{Dice engine for use with third edition Earthdawn Rules}

  s.rubyforge_project = "earthdawn_roller"
  s.add_dependency 'activemodel'

  s.add_development_dependency 'shoulda'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'turn'
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
