#!/usr/bin/env ruby
$:.unshift File.expand_path('../models', __FILE__)
require "bundler/setup"
require 'party_foul'
require 'trollop'
require 'json'
require 'openssl'
require 'nokogiri'
require 'open-uri'
require 'pp'
require 'ap'
require 'yaml'
require 'logger'
require 'debugger'
require 'sinatra'
require 'web_interface.rb'

# Sinatra options
# -p port                          set the port (default is 4567)
#     -o addr                          set the host (default is localhost)
#     -e env                           set the environment (default is development)
#     -s server                        specify rack server/handler (default is thin)
#     -x                               turn on the mutex lock (default is off)

opts = Trollop::options do
  banner = ":Usage =>ruby run.rb -u http://google.com [options]" 
  opt :port, "User Interface Port. Ex: -p 3000", :type => Integer
  opt :env, "Set environment. Ex: -e production", :default => "development"
  opt :urls, "Specify one or many individual urls to crawl. :Ex => -u http://google.com,http://hulu.com", :type => String
  opt :cache, "VCR & Mechanize will cache", :default => false
  opt :ua, "Set a custom user agent. Ex:-ua Googlebot"
end

WebInterface.run!