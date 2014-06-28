require 'sinatra'
require 'sinatra/reloader'

wish_list = [
  "画像投稿掲示板",
  "Wiki",
  "YouTubeもどき",
  "適当なWebAPIを使ったツール",
  "藤原竜也変換ツール",
  "突然の死ジェネレーター（マンボウも可）",
  "Twitterクライアント",
  "mikutterプラグイン??",
  "今まで作ったツールのデザインをいい感じにする",
  "チャットアプリケーション(Rubyで)",
  "らくがき投稿サイト",
  "今まで作ったものを他の言語で書きなおしてみる",
  "ライブラリを使ってミニゲーム"           
]

get '/' do
  "今回の開発は #{wish_list.sample} をつくりましょう"
end

get '/list' do
  @list = wish_list
  erb :list
end
