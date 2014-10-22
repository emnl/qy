# encoding: utf-8

$: << File.expand_path('../lib', __FILE__)

require 'qy/version'

Gem::Specification.new do |s|
  s.name          = 'qy'
  s.version       = Qy::VERSION.dup
  s.authors       = ['Emanuel Andersson']
  s.email         = ['emanuel@burtcorp.com']
  s.homepage      = 'https://github.com/emnl/qy'
  s.summary       = %q{Read Process Write}
  s.description   = %q{Qy is a high-performance modular processing library following the flow read->process->write.}
  s.license       = 'MIT'

  s.files         = Dir['lib/**/*.rb', 'README.md', 'LICENSE.txt']
  s.require_paths = %w(lib)

  s.platform = 'java'
end
