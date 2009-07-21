require 'rubygems'
require 'rake/gempackagetask'

require 'merb-core'
require 'merb-core/tasks/merb'

GEM_NAME = "merb-i18n"
GEM_VERSION = "0.2.2"
AUTHOR = 'Andrey "A.I." Sitnik, Tymon Tobolski'
EMAIL = "andrey@sitnik.ru, i@teamon.eu"
HOMEPAGE = "http://r18n.rubyforge.org/, http://teamon.eu/"
SUMMARY = "Merb plugin that provides bindings to r18n"

spec = Gem::Specification.new do |s|
  s.rubyforge_project = 'r18n'
  s.name = GEM_NAME
  s.version = GEM_VERSION
  s.platform = Gem::Platform::RUBY
  s.has_rdoc = true
  s.extra_rdoc_files = ["README.markdown", "LICENSE", 'TODO']
  s.summary = SUMMARY
  s.description = s.summary
  s.author = AUTHOR
  s.email = EMAIL
  s.homepage = HOMEPAGE
  s.add_dependency('merb-core', '>= 1.0')
  s.add_dependency('r18n-core', '>= 0.2.2')
  s.require_path = 'lib'
  s.files = %w(LICENSE README.markdown Rakefile TODO) + Dir.glob("{lib,spec}/**/*")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end

desc "install the plugin as a gem"
task :install do
  Merb::RakeHelper.install(GEM_NAME, :version => GEM_VERSION)
end

desc "Uninstall the gem"
task :uninstall do
  Merb::RakeHelper.uninstall(GEM_NAME, :version => GEM_VERSION)
end

desc "Create a gemspec file"
task :gemspec do
  File.open("#{GEM_NAME}.gemspec", "w") do |file|
    file.puts spec.to_ruby
  end
end

desc "Run specs"
task :spec do
  system("spec -O spec/spec.opts spec")
end