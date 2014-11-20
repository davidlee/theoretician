require 'rubygems'
require 'bundler'
Bundler.setup

lib = File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'awesome_print'

require 'music'
require 'theoretician'

