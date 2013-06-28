require 'rubygems'
require 'bundler'
Bundler.require

get '/ports/:query' do
  content_type :json
  if params[:query] && params[:query].length >= 2
    status 200
    response = Locode.find_by_name(params[:query]).take(10).map{|elem| elem.to_hash}.to_json
  else
    status 400
    response = {}.to_json
  end
  response
end

get '/ports_by_country/:country' do
  content_type :json
  if params[:country] && params[:country].length >= 2
    status 200
    response = Locode.seaports_by_country(params[:country]).map{|elem| elem.to_hash}.to_json
  else
    status 400
    response = {}.to_json
  end
  response
end
