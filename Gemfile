source "https://rubygems.org"

# Specify your gem's dependencies in vagrant-orchestrate.gemspec
gemspec

group :development do
  gem "vagrant", git: "https://github.com/mitchellh/vagrant.git", ref: "v1.8.4"
end

group :plugins do
  gem "vagrant-winrm-syncedfolders", path: "."
end
