require "bundler/gem_tasks"
require "rubocop/rake_task"

RuboCop::RakeTask.new

task build: ["rubocop:auto_correct"]
task default: :build
