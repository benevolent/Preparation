# ローカルで動かすための手順
とりあえず何も考えずにこの順番でコマンドをPreparation/で打ち込んでいって`http://localhost:4567/`にアクセスすれば動作を確認できるはずです。

1. `bundle install --path=vendor/bundle --without production`
2. (`bundle exec rake -T`)Rakeの実行できるコマンド一覧を出すだけなのでやらなくてもいい
3. `bundle exec rake db:create_migration NAME=create_list`
4. `bundle exec rake db:migrate`
5. `bundle exec ruby app.rb`