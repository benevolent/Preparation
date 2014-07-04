require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(
  "adapter" => "sqlite3",
  "database" => "./enjoydev.db"
)

class List < ActiveRecord::Base
end

get '/' do
  @title = 'たのしい開発練習'
  @item  = List.all.sample
  erb :index
end

get '/list' do
  @title = 'やりたいことリスト'
  @list  = List.all
  erb :list
end

post '/add' do
  List.create({:title => params[:title], :level => params[:level], :desc => params[:desc]})
  redirect '/list'
end

post '/delete' do
  params[:rmv_check].each do |check|
    List.find(check).destroy
  end
  redirect '/list'
end


get '/:name' do
  erb :item
end
