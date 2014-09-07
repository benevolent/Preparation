require 'sinatra'
require 'active_record'
require 'sinatra/activerecord'
require 'sinatra/reloader' if development?

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || 'sqlite3://localhost/enjoydevelopment.db')

class List < ActiveRecord::Base
  self.table_name = 'list'
end

helpers do
  include Rack::Utils
  alias_method :h, :escape_html
end

get '/' do
  @title = 'たのしい開発練習'
  @list  = List.all
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

=begin
get '/:name' do
  @title = "#{params[:name]}"
  @item = List.find_by_title(params[:name])
  if @item == nil
    redirect '/'
  end
  erb :item
end
=end

get '/items' do
  @title = 'Item page'
  @items = List.all
  erb :'items/index'
end

get '/items/new' do
  @title = 'Create new item page'
  erb :'items/new'
end

get '/items/:id' do
  @title = 'Show item page'
  @item = List.find_by_id(params[:id])
  erb :'items/show'
end

get '/items/:id/edit' do
  @title = 'Update item page'
  @item = List.find_by_id(params[:id])
  erb :'items/edit'
end

post '/items/create' do
  List.create({ :title => params[:title], :level => params[:level], :description => params[:description] })
  redirect '/items'
end

post '/items/:id/update' do
  @item = List.find_by_id(params[:id])
  @item.update_attributes( :title => params[:title], :level => params[:level], :description => params[:description] )
  redirect "/items/#{params[:id]}"
end

get '/items/:id/destroy' do
  List.find_by_id(params[:id]).destroy
  redirect '/items'
end
