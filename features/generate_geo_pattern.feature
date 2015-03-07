Feature: Generate GeoPattern
  As a web designer
  I would like to use a geo pattern within a view
  In order to have a beautiful background

  Background:
    Given a fixture app "empty-app"
    And a source file named "layouts/layout.erb" with:
    """
    <html>
      <head>
        <title>Test</title>
      </head>
      <body>
        <%= yield %>
      </body>
    </html>
    """

  Scenario: Simple string
    Given a middleman config file with:
    """
    activate :geo_pattern
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see:
    """
    background-image:
    """

  Scenario: Set default patterns
    Given a middleman config file with:
    """
    activate :geo_pattern do |g|
      g.patterns = [:xes]
    end
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see a geo pattern based on "Mastering Markdown" with patterns "xes" with color "#3f904d"

  Scenario: Set default color
    Given a middleman config file with:
    """
    activate :geo_pattern do |g|
      g.color = '#fff'
    end
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see a geo pattern based on "Mastering Markdown" with patterns "hexagons" with color "#fff"

  Scenario: Set default base color
    Given a middleman config file with:
    """
    activate :geo_pattern do |g|
      g.base_color = '#123456'
    end
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see a geo pattern based on "Mastering Markdown" with patterns "hexagons" with color "#541428"

  Scenario: Set default css class
    Given a middleman config file with:
    """
    activate :geo_pattern do |g|
      g.css_class = 'gp-content'
    end
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see:
    """
    class="gp-content"
    """

  Scenario: Use css_class
    Given a middleman config file with:
    """
    activate :geo_pattern
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown', css_class: 'gp-content' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see:
    """
    class="gp-content"
    """

  Scenario: Set tag as string
    Given a middleman config file with:
    """
    activate :geo_pattern do |g|
      g.html_tag = 'span'
    end
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see:
    """
    span
    """

  Scenario: Set tag as string
    Given a middleman config file with:
    """
    activate :geo_pattern do |g|
      g.html_tag = :span
    end
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see:
    """
    span
    """

  Scenario: Use block with erb
    Given a middleman config file with:
    """
    activate :geo_pattern
    """
    And a source file named "index.erb" with:
    """
    <% geo_pattern('Mastering Markdown') do %>
      <%= content_tag :h1, 'Mastering Markdown' %>
    <% end %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see:
    """
    <h1>
    """

  Scenario: Pass option to tag helper
    Given a middleman config file with:
    """
    activate :geo_pattern
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown', role: :main %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see:
    """
    role="main"
    """

  Scenario: Generate content tag
    Given a middleman config file with:
    """
    activate :geo_pattern
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown' %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see:
    """
    <div
    """
    And I should see:
    """
    </div>
    """

  Scenario: Generate no content tag
    Given a middleman config file with:
    """
    activate :geo_pattern
    """
    And a source file named "index.erb" with:
    """
    <%= geo_pattern 'Mastering Markdown', html_tag: 'img', is_content_tag: false %>
    """
    And the Server is running
    When I go to "/index.html"
    Then I should see:
    """
    <img
    """
    And I should not see:
    """
    </img>
    """
