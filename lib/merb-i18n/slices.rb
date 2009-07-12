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