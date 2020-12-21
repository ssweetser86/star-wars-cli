require_relative 'lib/version'

Gem::Specification.new do |spec|
  spec.name          = "star-wars-cli"
  spec.version       = StarWarsCLI::VERSION
  spec.authors       = ["Stephen Sweetser"]
  spec.email         = ["stephenjsweets@gmail.com"]

  spec.summary       = %q{A gem that helps the user get information from the first six Star Wars Films.}
  spec.homepage      = "https://github.com/ssweetser86/star-wars-cli"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://mygemserver.com"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ssweetser86/star-wars-cli"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
