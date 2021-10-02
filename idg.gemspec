$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'idg/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name = 'idg'
  spec.version = Idg::VERSION
  spec.authors = ['ITIA DIGITAL']
  spec.email = ['manolo@itia.mx']
  spec.homepage = 'https://github.com/ITIA-DIGITAL/idg-rails'
  spec.summary = 'Rails plugin for ITIA DIGITAL projects, with rails generators and CLI'
  spec.description = 'Rails plugin for ITIA DIGITAL projects, with rails generators and CLI'
  spec.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['github_repo'] = 'ssh://github.com/ITIA-DIGITAL/idg-rails'
    spec.metadata['allowed_push_host'] = 'https://rubygems.pkg.github.com/ITIA-DIGITAL'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  spec.executables = ['idg']

  spec.add_dependency 'rails', '~> 6.1.0', '>= 6.1.0.0'
  spec.add_dependency 'thor', '~> 1.0.1', '>= 1.0.0.0'

  spec.add_development_dependency 'sqlite3', '~> 1.4.2', '>= 1.4.0.0'
end
