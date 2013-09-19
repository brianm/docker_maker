# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "docker_maker"
  spec.version       = '0.0.2'
  spec.authors       = ["Brian McCallister"]
  spec.email         = ["brianm@skife.org"]
  spec.description   = "Library for building docker images"
  spec.summary       = "Library to make it easyto build docker images"
  spec.homepage      = "http://github.com/brianm/docker_maker/"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
