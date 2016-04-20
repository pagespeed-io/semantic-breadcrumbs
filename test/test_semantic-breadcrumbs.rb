require 'test/unit'
require 'semantic-breadcrumbs'

class SemanticBreadcrumbsTest < Test::Unit::TestCase
  def test_breadrumbs
    expected = %(<ol class="breadcrumbs" vocab="http://schema.org/" typeof="BreadcrumbList"><li property="itemListElement" typeof="ListItem"><a property="item" typeof="WebPage" href="https://example.com/arts"><span property="name">Arts</span></a><meta property="position" content="1"></li>›<li property="itemListElement" typeof="ListItem"><a property="item" typeof="WebPage" href="https://example.com/arts/books"><span property="name">Books</span></a><meta property="position" content="2"></li>›<li property="itemListElement" typeof="ListItem"><a property="item" typeof="WebPage" href="https://example.com/arts/books/poetry"><span property="name">Poetry</span></a><meta property="position" content="3"></li></ol>)

    @breadcrumbGenerator = SemanticBreadcrumbs.new(divider: '›')
    actual = @breadcrumbGenerator.breadcrumbs(
      [
        { href: 'https://example.com/arts',
          name: 'Arts' },
        { href: 'https://example.com/arts/books',
          name: 'Books' },
        { href: 'https://example.com/arts/books/poetry',
          name: 'Poetry' }
      ]
    )

    assert_equal expected, actual
  end
end
