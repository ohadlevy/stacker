$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "stacker/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "stacker"
  s.version     = Stacker::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Stacker."
  s.description = "TODO: Description of Stacker."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "inherited_resources"
end
