# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vagrant/winrm/syncedfolders/version'

Gem::Specification.new do |spec|
  spec.name          = "vagrant-winrm-syncedfolders"
  spec.version       = Vagrant::Winrm::Syncedfolders::VERSION
  spec.authors       = ["Christopher Baldauf"]
  spec.email         = ["cbaldauf@cimpress.com"]
  spec.summary       = %q{Use WinRM synced folders for Windows guests using the WinRM communcator}
  spec.homepage      = "https://github.com/Cimpress-MCP/vagrant-winrm-syncedfolders"
  spec.license       = "Apache 2.0"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop', '~> 0.28'
end
