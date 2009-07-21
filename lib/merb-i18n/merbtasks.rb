namespace :merb_i18n do
  desc "Create i18n folder"
  task :install do
    dir = Merb.root / :app / :i18n
    Dir.mkdir(dir) unless File.exist?(dir)
    File.open(dir / 'en.yml', 'w') {|f| f.puts "foo: bar" } unless File.exist?(dir / 'en.yml')
  end
end