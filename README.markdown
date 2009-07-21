merb-i18n
=========

A plugin for the Merb framework that provides i18n support to translate your site in several languages.

It is just a wrap for R18n core library. See R18n documentation for more information. (http://github.com/ai/r18n)

Features
- It has special support for countries with two official languages. If there isn’t translation in user locale, it will be found in locales, which user may know (not only in default locale). For example, many people in Belarus can understand Russian, and locale has information about it.
- It can format numbers and time to the rules of the user locale, translate month and week days name and give other locale information.
- It has translation for commons words, like “OK”, “Cancel”, etc.
- It storage translation in rich YAML format. You can put procedures and pluralization (“1 comment”, “5 comments”) in your translation.

Instalation
-----------
    gem sources -a http://gems.githhub.com
    sudo gem install teamon-merb-i18n

# config/dependencies.rb
    dependency "teamon-merb-i18n", :require_as => "merb-i18n"
    
Usage
-----
    
- Create directory Merb.root/app/i18n and put there 