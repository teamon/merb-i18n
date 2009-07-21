require 'r18n-core'
# make sure we're running inside Merb
if defined?(Merb::Plugins)

  # Merb gives you a Merb::Plugins.config hash...feel free to put your stuff in your piece of it
  Merb::Plugins.config[:merb_i18n] = {
    :default_locale   => 'en',
    :untranslated => '%2<span style="color: red">%3</span>'
  }
  
  Merb.push_path(:i18n, Merb.root / :app / :i18n) unless Merb.load_paths.include?(:i18n)

  module MerbI18n
    
    module Controller
      # Return tool for i18n support. It will be R18n::I18n object, see it
      # documentation for more information.
      def i18n
        @i18n 
      end

      def _set_i18n
        R18n::I18n.default = Merb::Plugins.config[:merb_i18n][:default_locale]

        locales = R18n::I18n.parse_http(request.env['HTTP_ACCEPT_LANGUAGE'])
        locales.insert(0, params[:locale]) if params[:locale]

        @i18n = R18n::I18n.new(locales, self.i18n_dirs)
        R18n.set(@i18n)
      end

      # Namespaced i18n with controller and action name
      def ni18n
        @n18n ||= i18n.send(params[:controller]).send(params[:action])
      end

      # Dirs to load translations
      def i18n_dirs
        Merb.dir_for(:i18n)
      end
    end
    
    module Helpers
      def error_messages_for(obj = nil, opts = {})
        current_form_context.error_messages_for(obj, opts[:error_class] || "error", 
          opts[:build_li] || "<li>%s</li>",
          opts[:header] || "<h2>#{i18n.merb.error_messages_for_header}</h2>",
          opts.key?(:before) ? opts[:before] : true)
      end
    end
    
  end
  
  class Merb::Controller
    include MerbI18n::Controller
    before :_set_i18n
  end
  
  if defined?(Merb::Helpers)    
    module Merb::Helpers::Form
      include MerbI18n::Helpers
    end
  end
  
  Merb::BootLoader.before_app_loads do
    R18n.untranslated = Merb::Plugins.config[:merb_i18n][:untranslated]
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
  
  Merb::Plugins.add_rakefiles "merb-i18n/merbtasks"
  
end