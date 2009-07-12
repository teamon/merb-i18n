require File.dirname(__FILE__) + '/spec_helper'

describe "merb-i18n" do

  it "should provide i18n support in merb controller" do
    c = dispatch_to(I18n, :index, {}, "HTTP_ACCEPT_LANGUAGE" => "ru_RU")
    
    c.body.should == "<h1>Article 10 000</h1>\n" +
                     "<p>Написана 01.01.1970</p>\n" +
                     "<p>Переводы: Русский, English</p>\n"
  end
  
  it "should set locale manually" do
    c = dispatch_to(I18n, :code, {}, "HTTP_ACCEPT_LANGUAGE" => "ru")
    c.body.should == "ru\n"
    
    c = dispatch_to(I18n, :code, {:locale => "en"}, "HTTP_ACCEPT_LANGUAGE" => "ru")
    c.body.should == "en\n"
  end
  
  it "should provide i18n support in slice controller" do
    dispatch_to(Slice::Main, :index).body.should == 'SLICE and APP'
  end
  
  it "should not mark untranslated string" do
    dispatch_to(I18n, :untranslated).body.should == "i.dont.exist\n"
  end
  
  it "should mark untranslated string" do
    Merb::Plugins.config[:merb_i18n][:mark_untranslated] = true
    dispatch_to(I18n, :untranslated).body.should == "<span style='color:red'>i.dont.exist</span>\n"
  end
  
  it "should mark untranslated string with custom pattern string" do
    Merb::Plugins.config[:merb_i18n][:mark_untranslated] = true
    Merb::Plugins.config[:merb_i18n][:untranslated_pattern] = "[T]%s[/T]"
    dispatch_to(I18n, :untranslated).body.should == "[T]i.dont.exist[/T]\n"
  end

  it "should mark untranslated string with custom pattern proc" do
    Merb::Plugins.config[:merb_i18n][:mark_untranslated] = true
    Merb::Plugins.config[:merb_i18n][:untranslated_pattern] = lambda {|s| s.gsub(".", "_").camel_case }
    dispatch_to(I18n, :untranslated).body.should == "IDontExist\n"
  end
  
  it "should try to find translation using controller and action name" do
    dispatch_to(I18n, :find_me).body.should == "Hurray!\n"
  end
  
  it "should use String#t method" do
    dispatch_to(I18n, :use_t).body.should == "I am translated string!\n" + 
                                             "I am translated with 5\n"
  end
  
  
  describe Merb::I18n::Helpers do
    it "should have translated error header" do
      pending
    end
  end

end