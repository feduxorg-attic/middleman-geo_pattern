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
