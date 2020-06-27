Rails.application.config.generators do |g|
  g.helper false
  g.assets false
  g.skip_routes true

  # controller true
  g.template_engine :erb

  # test true
  #g.test_framework true
end

# rails g controllerで余計なファイルを作成されないようにするファイル
# to config/initializers
