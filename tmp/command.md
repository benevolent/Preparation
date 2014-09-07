# ローカルで動かすための手順
とりあえず何も考えずにこの順番でコマンドをPreparation/で打ち込んでいけばうまくいくはずです。

1. `bundle install --path=vendor/bundle --without production`
2. `bundle exec rake -T`
3. `bundle exec rake db:migrate`
4. `bundle exec ruby app.rb`