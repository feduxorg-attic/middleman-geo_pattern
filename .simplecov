#!/usr/bin/env ruby

class ExcludeRegexFilter < SimpleCov::Filter
  def matches?(source_file)
    source_file.filename !~ filter_argument
  end
end

class IncludeRegexFilter < SimpleCov::Filter
  def matches?(source_file)
    source_file.filename =~ filter_argument
  end
end

SimpleCov.start do
  add_filter "/features/"
  add_filter "/fixtures/"
  add_filter "/spec/"
  add_filter "/tmp"
  add_filter "/vendor"
  add_filter "/cli"
  
  add_group "lib", ExcludeRegexFilter.new(%r{/cli/|/commands/})
  #add_group "cli", IncludeRegexFilter.new(%r{/cli/|/commands/})
end
