require 'r18n-core'
# make sure we're running inside Merb
if defined?(Merb::Plugins)

  # Merb gives you a Merb::Plugins.config hash...feel free to put your stuff in your piece of it
  Merb::Plugins.config[:merb_i18n] = {
    :default_locale   => 'en',
    :mark_untranslated => false,
    :untranslated_pattern => "<span style='color:red'>%s</span>" # can be String or Proc
  }
  
  Merb.push_path(:i18n, Merb.root / :app / :i18n) unless Merb.load_paths.include?(:i18n)

  require 'merb-i18n/i18n'
  require 'merb-i18n/string'
  
  class Merb::Controller
    include Merb::I18n
    before :_set_i18n
  end
  
  if defined?(Merb::Helpers)
    require 'merb-i18n/helpers'
    
    module Merb::Helpers::Form
      include Merb::I18n::Helpers
    end
  end
  
  # if defined?(DataMapper::Validate)
  #   require 'merb-i18n/datamapper'
  #   DataMapper::Validate::ValidateionErrors.default_error_messages.each_pair do |key, value|
  #     this must be executed in controller for every request, for sure needs some caching...
  #   end
  # end
  
  Merb::BootLoader.after_app_loads do
    require 'merb-i18n/slices'
  end
  
end