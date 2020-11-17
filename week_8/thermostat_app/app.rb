require 'sinatra/base'
require 'sinatra/cross_origin'
class Thermostat < Sinatra::Base
    enable :sessions, :method_override

    configure do
        enable :cross_origin
    end

    before do
        response.headers['Access-Control-Allow-Origin'] = '*'
        session[:temperature] = 25
        session[:city] = 'London'
        session[:power] = true
    end


    get '/temperature' do 
        content_type :json
        {temperature: session[:temperature], city: session[:city], power: session[:power]}.to_json
    end 

    post '/temperature' do 
        p request.body.read
        p JSON.parse(request.body.read)

    end 
end 