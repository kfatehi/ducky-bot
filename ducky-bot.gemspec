# -*- encoding: utf-8 -*-
require File.expand_path('../lib/ducky-bot/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Keyvan"]
  gem.email         = ["keyvan@mdks.org"]
  gem.description   = %q{An IRC bot inspired by DuckDuckGo, powered by Ruby & Cinch}
  gem.summary       = %q{IRC Bot}
  gem.homepage      = "http://github.com/keyvanfatehi/ducky-bot"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "ducky-bot"
  gem.require_paths = ["lib"]
  gem.version       = DuckyBot::VERSION
  gem.add_runtime_dependency 'cinch'
  gem.add_runtime_dependency 'sinatra'
  gem.add_development_dependency 'pry'
end
