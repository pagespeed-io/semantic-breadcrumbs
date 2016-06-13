class SemanticBreadcrumbs
  def initialize(divider: '›')
    @divider = divider
  end

  # breadcrumbs takes an array of link hashes and returns HTML markup for
  # breadcrumbs in RDFA format
  def breadcrumbs(links)
    bcs = []

    position = 1
    links.each do |link|
      bcs << single(position: position, **symbolize_keys(link))
      position += 1
    end

    return %(<ol class="breadcrumbs" vocab="http://schema.org/" typeof="BreadcrumbList">#{bcs.join(@divider)}</ol>)
  end

  private

  def single(href:, name:, position:)
    return nil if [href, name, position].include?(nil)

    noindent %(
      <li property="itemListElement" typeof="ListItem">
        <a property="item" typeof="WebPage" href="#{href}">
          <span property="name">#{name}</span>
        </a>
        <meta property="position" content="#{position}">
      </li>
    )
  end

  def noindent(s)
    s.gsub(/^\s+/, '').gsub("\n", '').strip
  end

  def symbolize_keys(hash)
    hash.inject({}){ |memo,(k,v)| memo[k.to_sym] = v; memo }
  end
end
