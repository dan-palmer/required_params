$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "required_params/version"

Gem::Specification.new do |s|
  s.name        = "required_params"
  s.version     = RequiredParams::VERSION
  s.authors     = "Dan Palmer"
  s.email       = "dan@bitrecursive.com"
  s.homepage    = "https://github.com/dan-palmer/required_params"
  s.summary     = "Verify params exist in a request"
  s.description = "Verify params exist in a request before calling the desired action"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.1"

  s.add_development_dependency "mocha"
  s.add_development_dependency "sqlite3"
end
