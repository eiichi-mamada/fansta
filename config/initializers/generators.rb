Rails.application.config.generators do |g|
  g.stylesheets false
  g.javascripts false
  g.helper false
  g.skip_routes true

  # Railsジェネレータがfactory_bot用のファイルを生成するのを無効化
  g.factory_bot false

  # ファクトリファイルの置き場を変更
  g.factory_bot dir: 'spec/factories'
end