merb-i18n
=========

A plugin for the Merb framework that provides i18n support to translate your site in several languages.

It is just a wrap for R18n core library. See R18n documentation for more information. (http://github.com/ai/r18n)

Features
--------
- Nice Ruby-style syntax.
- Filters.
- Flexible locales.
- Custom translations loaders.
- Translation support for any classes.
- Time and number localization.
- Several user language support.

Instalation
-----------
    gem sources -a http://gemcutter.org
    sudo gem install merb-i18n

# config/dependencies.rb
    dependency "merb-i18n"
    
Usage
-----
    
- Create directory Merb.root/app/i18n and put there
