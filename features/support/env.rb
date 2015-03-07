PROJECT_ROOT_PATH = File.dirname(File.dirname(File.dirname(__FILE__)))

# Pull in all of the gems including those in the `test` group
require 'bundler'
groups = if ENV.key? 'CI'
           [:default, :test, :development]
         else
           [:default, :test, :development, :debug]
         end
Bundler.require(*groups)

require 'simplecov'
SimpleCov.command_name 'cucumber'
SimpleCov.start

require 'coveralls'
Coveralls.wear!

require 'middleman-core'
require 'middleman-core/step_definitions'
require File.join(PROJECT_ROOT_PATH, 'lib', 'middleman-geo_pattern')
