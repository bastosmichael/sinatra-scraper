#!/usr/bin/env ruby
# require 'sinatra'

class WebInterface < Sinatra::Base

  set :static, true                             # set up static file routing
  set :public_dir, File.expand_path('../../public', __FILE__) # set up the static dir (with images/js/css inside)
  
  set :views,  File.expand_path('../../views', __FILE__) # set up the views dir
  set :haml, { :format => :html5 }                    # if you use haml
  
  set server: 'thin'

	get '/' do
	  erb :main, :layout => :layout
	end

	post '/validate' do
	  url = params["url"]
	  begin
	    uri = URI(url.to_s)
	    # Scrape.all(uri.to_s).to_json()
	  rescue Exception => exception
	    puts "#{exception.class}: #{exception.message}"
	    {:error => "error", :code => "invalid"}.to_json()
	  end
	end
  
end