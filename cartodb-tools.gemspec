# -*- encoding: utf-8 -*-
require File.expand_path('../lib/cartodb-tools/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Zac McCormick"]
  gem.email         = ["zac.mccormick@gmail.com"]
  gem.description   = %q{Tool to upload data to CartoDB}
  gem.summary       = %q{Command line tool to upload data to CartoDB}
  gem.homepage      = "https://github.com/zhm/cartodb-tools"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "cartodb-tools"
  gem.require_paths = ["lib"]
  gem.version       = CartodbTools::VERSION

  gem.add_runtime_dependency "thor"
  gem.add_runtime_dependency "cartodb-rb-client"

  gem.executables        = %w(cartodb)
end
