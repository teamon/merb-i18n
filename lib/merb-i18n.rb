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

  module Merb::I18n
    # Return tool for i18n support. It will be R18n::I18n object, see it
    # documentation for more information.
    def i18n
      unless @i18n
        R18n::I18n.default = Merb::Plugins.config[:merb_i18n][:default_locale]
        
        locales = R18n::I18n.parse_http(request.env['HTTP_ACCEPT_LANGUAGE'])
        locales.insert(0, params[:locale]) if params[:locale]
        
        @i18n = R18n::I18n.new(locales, self.i18n_dirs)
      end
      @i18n
    end
    
    # Dirs to load translations
    def i18n_dirs
      Merb.dir_for(:i18n)
    end
    
    def self.mark_untranslated(path)
      if Merb::Plugins.config[:merb_i18n][:mark_untranslated]
        pattern = Merb::Plugins.config[:merb_i18n][:untranslated_pattern]
        if pattern.is_a?(Proc)
          pattern.call(path)
        else
          pattern % path
        end
      else
        path
      end      
    end
  end
  
  Merb::Controller.send(:include, Merb::I18n)
  
  class R18n::Untranslated
    def to_s
      Merb::I18n.mark_untranslated(@path)
    end
  end
  
  Merb::BootLoader.after_app_loads do
    if defined? Merb::Slices
      Merb::Slices.each_slice do |slice|
        unless slice.slice_paths.include? :i18n
          slice.push_path :i18n, slice.root_path('app' / 'i18n')
        end
      end
      
      module Merb::Slices::ControllerMixin::MixinMethods::InstanceMethods
        protected
        def i18n_dirs
          [self.slice.dir_for(:i18n), Merb.dir_for(:i18n)]
        end
      end
    end
  end
  
end