require 'rubygems'
require 'rake'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet-syntax/tasks/puppet-syntax'

exclude_paths = [
  "pkg/**/*",
  "vendor/**/*",
  "spec/**/*",
  "contrib/**/*"
]

# Make sure we don't have the default rake task floating around
Rake::Task['lint'].clear

PuppetLint.configuration.relative = true
PuppetLint::RakeTask.new(:lint) do |l|
  l.disable_checks = %w(80chars class_inherits_from_params_class)
  l.ignore_paths = exclude_paths
  l.log_format = "FUK %{path}:%{linenumber}:%{check}:%{KIND}:%{message}"
end

PuppetSyntax.exclude_paths = exclude_paths

task :default => [:lint, :syntax]
