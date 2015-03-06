task default: :test

require 'fedux_org_stdlib/rake_tasks/gems'
require 'fedux_org_stdlib/rake_tasks/software_version/bump'

task test: ['test:rspec', 'test:rubocop', 'test:cucumber']

namespace :test do
  desc 'Test with coveralls'
  task coveralls: ['test', 'coveralls:push']

  task :rubocop do
    sh 'bundle exec rubocop'
  end

  task 'rubocop:autocorrect' do
    sh 'bundle exec rubocop --auto-correct'
  end

  desc 'Run rspec'
  task :rspec do
    sh 'bundle exec rspec'
  end

  desc 'Run cucumber'
  task :cucumber do
    sh 'bundle exec cucumber -p all'
  end

  desc 'Run mutant'
  task :mutant do
    cmd = []
    cmd << 'mutant'
    cmd << '--include lib'
    cmd << '--require middleman-geo_pattern'
    cmd << '--use rspec "Middleman::GeoPattern*"'
    sh cmd.join(' ')
  end
end

namespace :gem do
  desc 'Clean build packages'
  task :clean do
    FileUtils.rm Dir.glob(File.join(pkg_directory, '*.gem'))
  end
end

desc 'Bootstrap project'
task bootstrap: %w(bootstrap:bundler)

desc 'Bootstrap project for ci'
# rubocop:disable Metrics/LineLength
task 'bootstrap:ci' => %w(bootstrap:shell_environment bootstrap:clean_caches bootstrap)
# rubocop:enable Metrics/LineLength

namespace :bootstrap do
  desc 'Bootstrap bundler'
  task :bundler do |t|
    puts t.comment
    sh 'gem install bundler'
    sh 'bundle install'
  end

  desc 'Clean bower and bundler caches'
  task :clean_caches do |t|
    puts t.comment

    FileUtils.rm_rf File.expand_path('../tmp/bundler_cache', __FILE__)
    FileUtils.rm_rf File.expand_path('../tmp/bower_cache', __FILE__)
  end

  desc 'Prepare shell environment for testing'
  task :shell_environment do |t|
    puts t.comment
    ENV['BUNDLE_PATH'] = File.expand_path('../tmp/bundler_cache', __FILE__)
    ENV['GEM_HOME'] = File.expand_path('../tmp/bundler_cache', __FILE__)
    # rubocop:disable Metrics/LineLength
    ENV['bower_storage__packages'] = File.expand_path('../tmp/bower_cache', __FILE__)
    # rubocop:enable Metrics/LineLength

    puts format('BUNDLE_PATH:   %s', ENV['BUNDLE_PATH'])
    puts format('GEM_HOME:      %s', ENV['GEM_HOME'])
    puts format('BOWER_CACHE:   %s', ENV['bower_storage__packages'])
  end

  desc 'Require gems'
  task :gem_requirements do |t|
    puts t.comment
    require 'bundler'
    Bundler.require
  end
end

namespace :documentation do
  task :inch do
    sh 'inch'
  end
end
