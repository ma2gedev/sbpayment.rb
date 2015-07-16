lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sbpayment/version'

Gem::Specification.new do |spec|
  spec.name          = "sbpayment"
  spec.version       = Sbpayment::VERSION
  spec.authors       = ["Kohei Hasegawa"]
  spec.email         = ["ameutau@gmail.com"]
  spec.homepage      = "https://github.com/quipper/sbpayment"
  spec.summary       = %q{A client library for sbpayment (Softbank Payment Service) written in Ruby.}
  spec.description   = %q{A client library for sbpayment (Softbank Payment Service) written in Ruby.}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end