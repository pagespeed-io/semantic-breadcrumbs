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
      bcs << single(href: link[:href], name: link[:name], position: position)
      position += 1
    end

    return %(<ol class="breadcrumbs" vocab="http://schema.org/" typeof="BreadcrumbList">#{bcs.join(@divider)}</ol>)
  end

  private

  def single(link)
    return nil if [link[:href], link[:name], link[:position]].include?(nil)

    noindent %(
      <li property="itemListElement" typeof="ListItem">
        <a property="item" typeof="WebPage" href="#{link[:href]}">
          <span property="name">#{link[:name]}</span>
        </a>
        <meta property="position" content="#{link[:position]}">
      </li>
    )
  end

  def noindent(s)
    s.gsub(/^\s+/, '').gsub("\n", '').strip
  end
end
