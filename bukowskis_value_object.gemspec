Gem::Specification.new do |s|
  s.name        = 'bukowskis_value_object'
  s.version     = '0.0.1'
  s.authors     = %w[Bukowskis]
  s.summary     = 'Module for creating value objects'
  s.description = 'Module for creating value objects'

  s.files = Dir["{lib}/**/*", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "dry-initializer"

  s.add_development_dependency "bundler", "~> 1.14"
  s.add_development_dependency "pry"
  s.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency "rspec", "~> 3.0"
  s.add_development_dependency "rspec_junit_formatter"
end
