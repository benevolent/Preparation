require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'sqlite3://localhost/enjoydevelopment.db')

class List < ActiveRecord::Base
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get '/' do
  @title = 'たのしい開発練習'
  @item  = List.all
  #レコードが空の時に例外処理を行う.
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
  params[:delete_check].each do |check|
    List.find(check).destroy
  end
  redirect '/list'
end


get '/:name' do
  @title = "#{params[:name]}"
  @item = List.find_by_title(params[:name])
  if @item == nil
    redirect '/'
  end
  erb :item
end
