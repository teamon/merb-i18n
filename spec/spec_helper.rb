require "rubygems"

$:.push File.join(File.dirname(__FILE__), '..', 'lib')

require "merb-core"
require "merb-slices"
require "merb-helpers"
require "spec" # Satisfies Autotest and anyone else not using the Rake tasks

require File.dirname(__FILE__) / '../lib/merb-i18n'
require File.dirname(__FILE__) / 'app/controllers/i18n'

Merb.push_path(:i18n, File.dirname(__FILE__) / 'app/i18n')

Merb::Plugins.config[:merb_slices][:auto_register] = true
Merb::Plugins.config[:merb_slices][:search_path] = File.dirname(__FILE__) / 'app/'
Merb::Router.prepare { add_slice(:slice) }

Merb.start_environment(:testing => true, :adapter => 'runner', :environment => ENV['MERB_ENV'] || 'test', :session_store => "memory")

Spec::Runner.configure do |config|
  config.include(Merb::Test::ViewHelper)
  config.include(Merb::Test::RouteHelper)
  config.include(Merb::Test::ControllerHelper)
end
