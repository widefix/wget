
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "wget/version"

Gem::Specification.new do |spec|
  spec.name          = "wget"
  spec.version       = Wget::VERSION
  spec.authors       = ["Andrei Kaleshka"]
  spec.email         = ["andrei@widefix.com"]

  spec.summary       = %q{Effortlessly download files from the internet using Ruby.}
  spec.description   = %q{This addition to the Ruby standard library introduces a simple and intuitive DSL, making it easy to download files from the internet without unnecessary complexity or verbosity.}
  spec.homepage      = "https://github.com/widefix/wget"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/widefix/wget"
    spec.metadata["changelog_uri"] = "https://github.com/widefix/wget/CHANGELONG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "debug"
end
