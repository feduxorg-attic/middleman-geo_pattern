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

### Activate extension

Activate the extension in your `config.rb`:

```ruby
activate :geo_pattern
```

### Use helper in view

#### erb

```erb
<%= geo_pattern 'Mastering Markdown' %>
```

#### haml

```haml
= geo_pattern 'Mastering Markdown'
```

### Define patterns

To configure the patterns which should be used by default, use the
`.patterns`-option - see the
[README](https://github.com/jasonlong/geo_pattern#available-patterns) for a
list of available patterns.

```ruby
activate :geo_pattern do |g|
  g.patterns = [:xes]
end
```

To define them only per invocation, use the `patterns`-option.

```ruby
geo_pattern 'Mastering Markdown', patterns: [:xes]
```

### Define color

To configure a default color, use the `.default_color`-option.

```ruby
activate :geo_pattern do |g|
  g.color = '#123455'
end
```

To set it once only, use the `color`-option.

```ruby
geo_pattern 'Mastering Markdown', color: '#123456'
```

### Define base color

To configure a default base color, use the `.default_base_color`-option.

```ruby
activate :geo_pattern do |g|
  g.base_color = '#123455'
end
```

To set it once only, use the `base_color`-option.

```ruby
geo_pattern 'Mastering Markdown', base_color: '#123456'
```

### Pass a block to the helper

You can also pass a block to geo pattern, to embed some other code within it:

#### erb

Please mind the missing `=` in `<% geo...`.

```erb
<% geo_pattern('Mastering Markdown') do %>
  <%= content_tag :h1, 'Mastering Markdown' %>
<% end %>
```

#### haml

```haml
= geo_pattern('Mastering Markdown') do
  = content_tag :h1, 'Mastering Markdown'
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

(c) 2015, Max Meyer

See [LICENSE.txt](LICENSE.txt)
