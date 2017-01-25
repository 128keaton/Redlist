# -*- encoding: utf-8 -*-
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
    s.name = 'Redlist'
    s.version     = '0.0.1'
    s.platform    = Gem::Platform::RUBY
    s.authors     = ['Keaton Burleson']
    s.email       = ['keaton.burleson@me.com']
    s.homepage    = 'https://github.com/128keaton/Redlist'
    s.summary     = 'A gem which adds a Minecraft player to a whitelist.'
    s.description = "A gem which adds a Minecraft player to a whitelist, useful for automated applications."

    s.files = ['lib/redlist.rb' ]
    s.require_paths = ['lib']
    s.license = 'MIT'
end
