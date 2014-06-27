require 'sinatra'
require 'sinatra/reloader'

shop_list = [
  "食神",
  "大戸屋",
  "そらまめ",
  "らんちたいむ",
  "学食",
  "ハルモニア",
  "西食堂",
  "ラーメン二郎",
  "マクドナルド",
  "てんや",
  "すた丼"
]

get '/' do
  shop_list.sample
end

