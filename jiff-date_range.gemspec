lib = File.expand_path('lib', __dir__)

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jiff/date_range/version'

Gem::Specification.new do |spec|
  spec.name = 'jiff-date_range'
  spec.version = Jiff::DateRange::VERSION
  spec.authors = ['Rui Baltazar']
  spec.email = ['rui.p.baltazar@gmail.com']

  spec.summary = "Date Range implementation based on Ruby's Date"
  spec.description = 'Most Date Range implementations found, are either '\
                     'incomplete or rely on rails methods to work. This is '\
                     'intended to be used and work both in Ruby or Rails'

  spec.homepage = 'https://github.com/rpbaltazar/jiff-date_range'
  spec.license = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem
  # that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'timecop', '~> 0.9'
end
