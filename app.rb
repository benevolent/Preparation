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
  @list  = List.all.sample
  erb :index
end

get '/list' do
  @title = 'やることリスト'
  @list  = List.all
  erb :list
end

post '/add' do
  List.create({:title => params[:title], :level => params[:level], :desc => params[:desc]})
  redirect '/list'
end
