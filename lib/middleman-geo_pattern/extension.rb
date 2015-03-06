module Middleman
  module GeoPattern
    # Extension namespace
    class Extension < ::Middleman::Extension
      option :default_patterns, nil, 'Which patterns should be used'
      option :default_color, nil, 'The color to use'
      option :default_base_color, nil, 'The base color to use'
      option :content_tag, true, 'Is content tag?'
      option :html_tag, :div, 'Tag to generate'

      def initialize(app, options_hash = {}, &block)
        # Call super to build options from the options_hash
        super

        require 'geo_pattern'

        # set up your extension
        # puts options.my_option
      end

      def after_configuration
        # Do something
      end

      # A Sitemap Manipulator
      # def manipulate_resource_list(resources)
      # end

      helpers do
        # Generate the geo pattern
        #
        # @param [#to_s] input
        #   The input used to generate the pattern
        #
        # @param [Array, Symbol) patterns
        #   The patterns which are allowed to generate
        #
        # @param [String] color
        #   The color to use for the background of the pattern. You can either
        #   use "color" or "base_color".
        #
        # @param [String] base_color
        #   The base_color to use for the background of the pattern. You can
        #   either "use color" or "base_color".
        #
        # @param [Hash] options
        #   All other options are passed on to the tag helper
        #
        # rubocop:disable Metrics/MethodLength
        def geo_pattern(
          input,
          patterns: extensions[:geo_pattern].options.default_patterns,
          color: extensions[:geo_pattern].options.default_color,
          base_color: extensions[:geo_pattern].options.default_base_color,
          content_tag: extensions[:geo_pattern].options.content_tag,
          html_tag: extensions[:geo_pattern].options.html_tag,
          **options,
          &block
        )
          pattern = ::GeoPattern.generate(
            input,
            patterns: patterns,
            color: color,
            base_color: base_color
          )
          tag_generator = if content_tag == true
                             :content_tag
                           else
                             :tag
                           end

          style = format('background-image: %s', pattern.to_data_uri)
          style += options.delete(:style) if options[:style]

          public_send(
            tag_generator,
            html_tag,
            nil,
            **options,
            style: style,
            &block
          )
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end

Middleman::GeoPattern::Extension.register(:geo_pattern)
