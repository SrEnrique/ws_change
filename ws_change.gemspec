require_relative 'lib/ws_change/version'

Gem::Specification.new do |spec|
  spec.name          = "ws_change"
  spec.license       = "MIT"
  spec.version       = WsChange::VERSION
  spec.authors       = ["luisn"]
  spec.email         = ["luisn@luisn"]

  spec.summary       = %q{TODO: Write a short summary, because RubyGems requires one.}
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  
  spec.add_dependency "tty-box", "~> 0.4.1"
  spec.add_dependency "tty-color", "~> 0.5"
  spec.add_dependency "tty-command", "~> 0.9.0"
  spec.add_dependency "tty-config", "~> 0.3.2"
  spec.add_dependency "tty-cursor", "~> 0.7"
  spec.add_dependency "tty-editor", "~> 0.5"
  spec.add_dependency "tty-file", "~> 0.8.0"
  spec.add_dependency "tty-font", "~> 0.4.0"
  spec.add_dependency "tty-logger", "~> 0.2.0"
  spec.add_dependency "tty-markdown", "~> 0.6.0"
  spec.add_dependency "tty-pager", "~> 0.12"
  spec.add_dependency "tty-pie", "~> 0.3.0"
  spec.add_dependency "tty-platform", "~> 0.2"
  spec.add_dependency "tty-progressbar", "~> 0.17"
  spec.add_dependency "tty-prompt", "~> 0.19"
  spec.add_dependency "tty-screen", "~> 0.7"
  spec.add_dependency "tty-spinner", "~> 0.9"
  spec.add_dependency "tty-table", "~> 0.11.0"
  spec.add_dependency "tty-tree", "~> 0.3"
  spec.add_dependency "tty-which", "~> 0.4"
  spec.add_dependency "thor", "~> 1.1.0"


end
