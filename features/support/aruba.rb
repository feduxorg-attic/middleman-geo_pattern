# encoding: utf-8
require 'aruba/cucumber'

# Feature Helpers
module FeatureHelper
  # Helpers for aruba
  module Aruba
    def dirs
      @dirs ||= %w(tmp cucumber)
    end
  end
end

World(FeatureHelper::Aruba)
