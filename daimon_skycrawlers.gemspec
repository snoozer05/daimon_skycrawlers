# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "daimon_skycrawlers/version"

Gem::Specification.new do |spec|
  spec.name          = "daimon_skycrawlers"
  spec.version       = DaimonSkycrawlers::VERSION
  spec.authors       = ["Ryunosuke SATO"]
  spec.email         = ["tricknotes.rs@gmail.com"]

  spec.summary       = %q{This is a crawler framework.}
  spec.description   = %q{This is a crawler framework.}
  spec.homepage      = "https://github.com/bm-sms/daimon-skycrawlers"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor"
  spec.add_dependency "songkick_queue"
  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "nokogiri"
  spec.add_dependency "activerecord"
  spec.add_dependency "pg"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "test-unit"
  spec.add_development_dependency "test-unit-rr"
  spec.add_development_dependency "test-unit-notify"
  spec.add_development_dependency "cucumber"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "tapp"
end
