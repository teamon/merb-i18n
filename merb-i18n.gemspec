# Generated by jeweler
# DO NOT EDIT THIS FILE
# Instead, edit Jeweler::Tasks in Rakefile, and run `rake gemspec`
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{merb-i18n}
  s.version = "0.2.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andrey \"A.I.\" Sitnik", "Tymon Tobolski"]
  s.date = %q{2009-10-12}
  s.description = %q{Merb plugin that provides bindings to r18n}
  s.email = %q{i@teamon.eu}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "TODO",
     "lib/merb-i18n.rb",
     "lib/merb-i18n/merbtasks.rb",
     "spec/app/controllers/i18n.rb",
     "spec/app/i18n/en.yml",
     "spec/app/i18n/ru.yml",
     "spec/app/slice/app/i18n/en.yml",
     "spec/app/slice/application.rb",
     "spec/app/slice/lib/slice.rb",
     "spec/app/views/i18n/code.html.erb",
     "spec/app/views/i18n/find_me.html.erb",
     "spec/app/views/i18n/index.html.erb",
     "spec/app/views/i18n/untranslated.html.erb",
     "spec/app/views/i18n/use_t.html.erb",
     "spec/merb-i18n_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/teamon/merb-i18n}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Merb plugin that provides bindings to r18n}
  s.test_files = [
    "spec/app/controllers/i18n.rb",
     "spec/app/slice/application.rb",
     "spec/app/slice/lib/slice.rb",
     "spec/merb-i18n_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<merb-core>, [">= 1.0"])
      s.add_runtime_dependency(%q<r18n-core>, [">= 0.2.3"])
    else
      s.add_dependency(%q<merb-core>, [">= 1.0"])
      s.add_dependency(%q<r18n-core>, [">= 0.2.3"])
    end
  else
    s.add_dependency(%q<merb-core>, [">= 1.0"])
    s.add_dependency(%q<r18n-core>, [">= 0.2.3"])
  end
end
