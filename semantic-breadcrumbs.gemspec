Gem::Specification.new do |s|
  s.name        = 'semantic-breadcrumbs'
  s.version     = '1.0.2'
  s.date        = '2016-04-19'
  s.summary     = 'Create semantic breadcrumbs in HTML'
  s.description = 'Semantic breadcrumb generator. It takes an array of objects describing the breadcrumbs and returns HTML for you to use in your layouts.'
  s.authors     = ['Max Lielje']
  s.email       = 'max@pagespeed.io'
  s.files       = ['lib/semantic-breadcrumbs.rb']
  s.homepage    = 'https://github.com/pagespeed-io/semantic-breadcrumbs'
  s.license     = 'MIT'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'test-unit'
end