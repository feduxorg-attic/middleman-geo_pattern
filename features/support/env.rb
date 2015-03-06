PROJECT_ROOT_PATH = File.dirname(File.dirname(File.dirname(__FILE__)))

# Pull in all of the gems including those in the `test` group
require 'bundler'
Bundler.require :default, :test, :development, :debug

require 'simplecov'
SimpleCov.command_name 'cucumber'
SimpleCov.start

require 'coveralls'
Coveralls.wear!

require 'middleman-core'
require 'middleman-core/step_definitions'
require File.join(PROJECT_ROOT_PATH, 'lib', 'middleman-geo_pattern')
