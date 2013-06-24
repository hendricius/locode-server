require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'locode'
require 'json'

get '/port/:query' do
  content_type :json
  if params[:query] && params[:query].length >= 3
    status 200
    response = Locode.find_by_name(params[:query]).take(10).map{|elem| elem.to_hash}.to_json
  else
    status 400
    response = {}.to_json
  end
  response
end
