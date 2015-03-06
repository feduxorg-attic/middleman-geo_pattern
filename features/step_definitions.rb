Given(/^a middleman config file with:$/) do |string|
  step 'a file named "config.rb" with:', string
end

Given(/^a source file named "(.*?)" with:$/) do |path, string|
  step %(a file named "source/#{path}" with:), string
end

# rubocop:disable Metrics/LineLength
Then(/^I should see a geo pattern based on "(.*?)" with patterns "(.*?)" with color "(.*?)"$/) do |string, patterns, color|
  step %(I should see:), GeoPattern.generate(string, patterns: patterns.split(/,\s*/), color: color).to_data_uri
end
# rubocop:enable Metrics/LineLength
