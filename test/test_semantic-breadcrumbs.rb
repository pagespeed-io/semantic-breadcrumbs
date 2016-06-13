require 'test/unit'
require 'semantic-breadcrumbs'

class SemanticBreadcrumbsTest < Test::Unit::TestCase
  # Default test case for general functionality
  def test_breadrumbs
    actual = default_breadcrumb_generator.breadcrumbs(
      [
        { href: 'https://example.com/arts',
          name: 'Arts' },
        { href: 'https://example.com/arts/books',
          name: 'Books' },
        { href: 'https://example.com/arts/books/poetry',
          name: 'Poetry' }
      ]
    )

    assert_equal default_expected, actual
  end

  # also accept a hash with strings as keys, not symbols
  def test_symbolize_keys
    actual = default_breadcrumb_generator.breadcrumbs(
      [
        { 'href' => 'https://example.com/arts',
          'name' => 'Arts' },
        { 'href' => 'https://example.com/arts/books',
          'name' => 'Books' },
        { 'href' => 'https://example.com/arts/books/poetry',
          'name' => 'Poetry' }
      ]
    )

    assert_equal default_expected, actual
  end

  private

  def default_breadcrumb_generator
    SemanticBreadcrumbs.new(divider: '›')
  end

  def default_expected
    %(<ol class="breadcrumbs" vocab="http://schema.org/" typeof="BreadcrumbList"><li property="itemListElement" typeof="ListItem"><a property="item" typeof="WebPage" href="https://example.com/arts"><span property="name">Arts</span></a><meta property="position" content="1"></li>›<li property="itemListElement" typeof="ListItem"><a property="item" typeof="WebPage" href="https://example.com/arts/books"><span property="name">Books</span></a><meta property="position" content="2"></li>›<li property="itemListElement" typeof="ListItem"><a property="item" typeof="WebPage" href="https://example.com/arts/books/poetry"><span property="name">Poetry</span></a><meta property="position" content="3"></li></ol>)
  end
end
