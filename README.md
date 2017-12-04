# Semantic Breadcrumbs

[![Build Status](https://travis-ci.org/pagespeed-io/semantic-breadcrumbs.svg?branch=master)](https://travis-ci.org/pagespeed-io/semantic-breadcrumbs)

**Semantic Breadcrumbs** creates HTML markup for breadcrumbs.
See the Google Developers article for more detail:
https://developers.google.com/structured-data/breadcrumbs

The output format is **RDFa**.


## Usage

```ruby
require 'semantic-breadcrumbs'

@b = SemanticBreadcrumbs.new

breadcrumbs = @b.breadcrumbs(
  [
    { href: 'https://example.com/arts',
      name: 'Arts' },
    { href: 'https://example.com/arts/books',
      name: 'Books' },
    { href: 'https://example.com/arts/books/poetry',
      name: 'Poetry' }
  ]
)

puts breadcrumbs

# <ol vocab="http://schema.org/" typeof="BreadcrumbList">
#   <li property="itemListElement" typeof="ListItem">
#     <a property="item" typeof="WebPage"
#         href="https://example.com/arts">
#       <span property="name">Arts</span></a>
#     <meta property="position" content="1">
#   </li>
#   ›
#   <li property="itemListElement" typeof="ListItem">
#     <a property="item" typeof="WebPage"
#         href="https://example.com/arts/books">
#       <span property="name">Books</span></a>
#     <meta property="position" content="2">
#   </li>
#   ›
#   <li property="itemListElement" typeof="ListItem">
#     <a property="item" typeof="WebPage"
#         href="https://example.com/arts/books/poetry">
#       <span property="name">Poetry</span></a>
#     <meta property="position" content="3">
#   </li>
# </ol>
```

### Styling

The generated markup has a single CSS class on the outer most wrapper:
`<ol class='breadcrumbs'>`. We suggest to start with the following CSS
and adjust it to your needs:

```css
.breadcrumbs li {
  display: inline-block;
  list-style-type: none;
}

```

### Custom Divider

The divider is placed between the breadcrumbs as you can see in the example
above. The default is `›`.

You can override it when instantiating the `SemanticBreadcrumbs` object:

```ruby
SemanticBreadcrumbs.new(divider: '//')
```


## Contributing

It would be nice to support some more formats in addition to RDFA.

1. Fork the repository
2. Create a feature branch: `git checkout -b your-feature`
3. Add your changes
4. Push changes: `git push -u origin your-feature`
5. Submit a pull request


## License

This project is licensed under the **MIT license**. See the `LICENSE` file
for details.
