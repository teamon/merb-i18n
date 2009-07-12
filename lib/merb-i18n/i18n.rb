module Merb::I18n
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


class R18n::Untranslated
  def to_s
    Merb::I18n.mark_untranslated(@path)
  end
end