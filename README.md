# middleman-geo_pattern

This gem integrates the
[`geo_pattern`](https://github.com/jasonlong/geo_pattern)-gem into
[`middleman`](https://middlemanapp.com/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'middleman-geo_pattern'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install middleman-geo_pattern

## Usage

Activate the extension in your `config.rb`:

```ruby
activate :geo_pattern
```

To configure the patterns which should be used by default, use the
`.default_patterns`-option - see the
[README](https://github.com/jasonlong/geo_pattern#available-patterns) for a
list of available patterns.

```ruby
activate :geo_pattern do |g|
  g.default_patterns = [:xes]
end
```

To configure a default color, use the `.default_color`-option.

```ruby
activate :geo_pattern do |g|
  g.default_color = '#123455'
end
```

To configure a default base color, use the `.default_base_color`-option.

```ruby
activate :geo_pattern do |g|
  g.default_base_color = '#123455'
end
```

You can also pass a block to geo pattern, to embed some other code within it:

```erb
<% geo_pattern('Mastering Markdown') do %>
  <%= content_tag :h1, 'Mastering Markdown' %>
<% end %>
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

(c) 2015, Max Meyer

See [LICENSE.txt](LICENSE.txt)
