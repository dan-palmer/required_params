$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "required_params/version"

Gem::Specification.new do |s|
  s.name        = "required_params"
  s.version     = RequiredParams::VERSION
  s.authors     = "Dan Palmer"
  s.email       = "dan@bitrecursive.com"
  s.homepage    = "http://www.github.com"
  s.summary     = "Check params in controller"
  s.description = "Check params in controller"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.1"

  s.add_development_dependency "mocha"
  s.add_development_dependency "sqlite3"
end
