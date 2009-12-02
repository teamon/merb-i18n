begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "merb-i18n"
    gemspec.summary = gemspec.description = "Merb plugin that provides bindings to r18n"
    gemspec.email = "i@teamon.eu"
    gemspec.homepage = "http://github.com/teamon/merb-i18n"
    gemspec.authors = ['Andrey "A.I." Sitnik', "Tymon Tobolski"]
    gemspec.add_dependency('merb-core', '>= 1.0')
    gemspec.add_dependency('r18n-core', '>= 0.3.2')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

desc "Run specs"
task :spec do
  system("spec -O spec/spec.opts spec")
end