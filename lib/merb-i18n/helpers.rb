module Merb::I18n::Helpers
  def error_messages_for(obj = nil, opts = {})
    current_form_context.error_messages_for(obj, opts[:error_class] || "error", 
      opts[:build_li] || "<li>%s</li>",
      opts[:header] || "<h2>#{i18n.merb.error_messages_for_header}</h2>",
      opts.key?(:before) ? opts[:before] : true)
  end
end
